<?php

namespace Botble\Revision;

use DateTime;
use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

/**
 * @mixin \Eloquent|SoftDeletes
 */
trait RevisionableTrait
{
    /**
     * @var array
     */
    protected $originalData = [];

    /**
     * @var array
     */
    protected $updatedData = [];

    /**
     * @var boolean
     */
    protected $updating = false;

    /**
     * @var array
     */
    protected $dontKeep = [];

    /**
     * @var array
     */
    protected $doKeep = [];

    /**
     * Keeps the list of values that have been updated
     *
     * @var array
     */
    protected $dirtyData = [];

    /**
     * Ensure that the bootRevisionableTrait is called only
     * if the current installation is a laravel 4 installation
     * Laravel 5 will call bootRevisionableTrait() automatically
     */
    public static function boot()
    {
        parent::boot();

        if (!method_exists(get_called_class(), 'bootTraits')) {
            static::bootRevisionableTrait();
        }
    }

    /**
     * Create the event listeners for the saving and saved events
     * This lets us save revisions whenever a save is made, no matter the
     * http method.
     */
    public static function bootRevisionableTrait()
    {
        static::saving(function ($model) {
            $model->preSave();
        });

        static::saved(function ($model) {
            $model->postSave();
        });

        static::created(function ($model) {
            $model->postCreate();
        });

        static::deleted(function ($model) {
            $model->preSave();
            $model->postDelete();
        });
    }

    /**
     * Generates a list of the last $limit revisions made to any objects of the class it is being called from.
     *
     * @param int $limit
     * @param string $order
     * @return mixed
     */
    public static function classRevisionHistory($limit = 100, $order = 'desc')
    {
        return Revision::where('revisionable_type', get_called_class())
            ->orderBy('updated_at', $order)->limit($limit)->get();
    }

    /**
     * Invoked before a model is saved. Return false to abort the operation.
     *
     * @return bool
     */
    public function preSave()
    {
        if (!isset($this->revisionEnabled) || $this->revisionEnabled) {
            // if there's no revisionEnabled. Or if there is, if it's true

            $this->originalData = $this->original;
            $this->updatedData = $this->attributes;

            // we can only safely compare basic items,
            // so for now we drop any object based items, like DateTime
            foreach ($this->updatedData as $key => $val) {
                if (gettype($val) == 'object' && !method_exists($val, '__toString')) {
                    unset($this->originalData[$key]);
                    unset($this->updatedData[$key]);
                    array_push($this->dontKeep, $key);
                }
            }

            // the below is ugly, for sure, but it's required so we can save the standard model
            // then use the keep / dontKeep values for later, in the isRevisionable method
            $this->dontKeep = isset($this->dontKeepRevisionOf) ?
                array_merge($this->dontKeepRevisionOf, $this->dontKeep)
                : $this->dontKeep;

            $this->doKeep = isset($this->keepRevisionOf) ?
                array_merge($this->keepRevisionOf, $this->doKeep)
                : $this->doKeep;

            unset($this->attributes['dontKeepRevisionOf']);
            unset($this->attributes['keepRevisionOf']);

            $this->dirtyData = $this->getDirty();
            $this->updating = $this->exists;
        }

        return true;
    }

    /**
     * Called after a model is successfully saved.
     *
     * @return void
     * @throws Exception
     */
    public function postSave()
    {
        if (isset($this->historyLimit) && $this->revisionHistory()->count() >= $this->historyLimit) {
            $limitReached = true;
        } else {
            $limitReached = false;
        }

        if (isset($this->revisionCleanup)) {
            $revisionCleanup = $this->revisionCleanup;
        } else {
            $revisionCleanup = false;
        }

        // check if the model already exists
        if (((!isset($this->revisionEnabled) || $this->revisionEnabled) && $this->updating) && (!$limitReached || $revisionCleanup)) {
            // if it does, it means we're updating

            $changes_to_record = $this->changedRevisionableFields();

            $revisions = [];

            foreach ($changes_to_record as $key => $change) {
                $revisions[] = [
                    'revisionable_type' => $this->getMorphClass(),
                    'revisionable_id'   => $this->getKey(),
                    'key'               => $key,
                    'old_value'         => Arr::get($this->originalData, $key),
                    'new_value'         => $this->updatedData[$key],
                    'user_id'           => $this->getSystemUserId(),
                    'created_at'        => new DateTime,
                    'updated_at'        => new DateTime,
                ];
            }

            if (count($revisions) > 0) {
                if ($limitReached && $revisionCleanup) {
                    $toDelete = $this->revisionHistory()->orderBy('id', 'asc')->limit(count($revisions))->get();
                    foreach ($toDelete as $delete) {
                        $delete->delete();
                    }
                }
                $revision = new Revision;
                DB::table($revision->getTable())->insert($revisions);
                event('revisionable.saved', ['model' => $this, 'revisions' => $revisions]);
            }
        }
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\MorphMany
     */
    public function revisionHistory()
    {
        return $this->morphMany(Revision::class, 'revisionable');
    }

    /**
     * Get all of the changes that have been made, that are also supposed
     * to have their changes recorded
     *
     * @return array fields with new data, that should be recorded
     */
    protected function changedRevisionableFields()
    {
        $changesToRecord = [];
        foreach ($this->dirtyData as $key => $value) {
            // check that the field is revisionable, and double check
            // that it's actually new data in case dirty is, well, clean
            if ($this->isRevisionable($key) && !is_array($value)) {
                if (!isset($this->originalData[$key]) || $this->originalData[$key] != $this->updatedData[$key]) {
                    $changesToRecord[$key] = $value;
                }
            } else {
                // we don't need these any more, and they could
                // contain a lot of data, so lets trash them.
                unset($this->updatedData[$key]);
                unset($this->originalData[$key]);
            }
        }

        return $changesToRecord;
    }

    /**
     * Check if this field should have a revision kept
     *
     * @param string $key
     *
     * @return bool
     */
    protected function isRevisionable($key)
    {

        // If the field is explicitly revisionable, then return true.
        // If it's explicitly not revisionable, return false.
        // Otherwise, if neither condition is met, only return true if
        // we aren't specifying revisionable fields.
        if (isset($this->doKeep) && in_array($key, $this->doKeep)) {
            return true;
        }

        if (isset($this->dontKeep) && in_array($key, $this->dontKeep)) {
            return false;
        }

        return empty($this->doKeep);
    }

    /**
     * Attempt to find the user id of the currently logged in user
     **/
    public function getSystemUserId()
    {
        try {
            if (Auth::check()) {
                return Auth::id();
            }
        } catch (Exception $exception) {
            return null;
        }

        return null;
    }

    /**
     * Called after record successfully created
     * @throws Exception
     */
    public function postCreate()
    {
        // Check if we should store creations in our revision history
        // Set this value to true in your model if you want to
        if (empty($this->revisionCreationsEnabled)) {
            // We should not store creations.
            return false;
        }

        if ((!isset($this->revisionEnabled) || $this->revisionEnabled)) {
            $revisions[] = [
                'revisionable_type' => $this->getMorphClass(),
                'revisionable_id'   => $this->getKey(),
                'key'               => self::CREATED_AT,
                'old_value'         => null,
                'new_value'         => $this->{self::CREATED_AT},
                'user_id'           => $this->getSystemUserId(),
                'created_at'        => new DateTime,
                'updated_at'        => new DateTime,
            ];

            $revision = new Revision;
            DB::table($revision->getTable())->insert($revisions);
            event('revisionable.created', ['model' => $this, 'revisions' => $revisions]);
        }

        return false;
    }

    /**
     * If soft deletes are enabled, store the deleted time
     * @throws Exception
     */
    public function postDelete()
    {
        if ((!isset($this->revisionEnabled) || $this->revisionEnabled)
            && $this->isSoftDelete()
            && $this->isRevisionable($this->getDeletedAtColumn())
        ) {
            $revisions[] = [
                'revisionable_type' => $this->getMorphClass(),
                'revisionable_id'   => $this->getKey(),
                'key'               => $this->getDeletedAtColumn(),
                'old_value'         => null,
                'new_value'         => $this->{$this->getDeletedAtColumn()},
                'user_id'           => $this->getSystemUserId(),
                'created_at'        => new DateTime,
                'updated_at'        => new DateTime,
            ];
            $revision = new Revision;
            DB::table($revision->getTable())->insert($revisions);
            event('revisionable.deleted', ['model' => $this, 'revisions' => $revisions]);
        }
    }

    /**
     * Check if soft deletes are currently enabled on this model
     *
     * @return bool
     */
    protected function isSoftDelete()
    {
        // check flag variable used in laravel 4.2+
        if (isset($this->forceDeleting)) {
            return !$this->forceDeleting;
        }

        // otherwise, look for flag used in older versions
        if (isset($this->softDelete)) {
            return $this->softDelete;
        }

        return false;
    }

    /**
     * @return mixed
     */
    public function getRevisionFormattedFields()
    {
        return $this->revisionFormattedFields;
    }

    /**
     * @return mixed
     */
    public function getRevisionFormattedFieldNames()
    {
        return $this->revisionFormattedFieldNames;
    }

    /**
     * Identifiable Name
     * When displaying revision history, when a foreign key is updated
     * instead of displaying the ID, you can choose to display a string
     * of your choice, just override this method in your model
     * By default, it will fall back to the models ID.
     *
     * @return string an identifying name for the model
     */
    public function identifiableName()
    {
        return $this->getKey();
    }

    /**
     * Revision Unknown String
     * When displaying revision history, when a foreign key is updated
     * instead of displaying the ID, you can choose to display a string
     * of your choice, just override this method in your model
     * By default, it will fall back to the models ID.
     *
     * @return string an identifying name for the model
     */
    public function getRevisionNullString()
    {
        return $this->revisionNullString ?? 'nothing';
    }

    /**
     * No revision string
     * When displaying revision history, if the revisions value
     * cant be figured out, this is used instead.
     * It can be overridden.
     *
     * @return string an identifying name for the model
     */
    public function getRevisionUnknownString()
    {
        return $this->revisionUnknownString ?? 'unknown';
    }

    /**
     * Disable a revisionable field temporarily
     * Need to do the adding to array longhanded, as there's a
     * PHP bug https://bugs.php.net/bug.php?id=42030
     *
     * @param mixed $field
     *
     * @return void
     */
    public function disableRevisionField($field)
    {
        if (!isset($this->dontKeepRevisionOf)) {
            $this->dontKeepRevisionOf = [];
        }
        if (is_array($field)) {
            foreach ($field as $oneField) {
                $this->disableRevisionField($oneField);
            }
        } else {
            $dont = $this->dontKeepRevisionOf;
            $dont[] = $field;
            $this->dontKeepRevisionOf = $dont;
            unset($dont);
        }
    }
}
