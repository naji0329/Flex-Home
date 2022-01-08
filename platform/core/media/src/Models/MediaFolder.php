<?php

namespace Botble\Media\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;
use RvMedia;

class MediaFolder extends BaseModel
{
    use SoftDeletes;

    /**
     * @var string
     */
    protected $table = 'media_folders';

    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'slug',
        'parent_id',
        'user_id',
    ];

    /**
     * @return HasMany
     */
    public function files(): HasMany
    {
        return $this->hasMany(MediaFile::class, 'folder_id', 'id');
    }

    /**
     * @return HasOne
     */
    public function parentFolder(): HasOne
    {
        return $this->hasOne(MediaFolder::class, 'id', 'parent');
    }

    protected static function boot()
    {
        parent::boot();
        static::deleting(function (MediaFolder $folder) {
            if ($folder->isForceDeleting()) {
                $files = MediaFile::where('folder_id', $folder->id)->onlyTrashed()->get();

                foreach ($files as $file) {
                    RvMedia::deleteFile($file);
                    $file->forceDelete();
                }
            } else {
                $files = MediaFile::where('folder_id', $folder->id)->withTrashed()->get();

                foreach ($files as $file) {
                    $file->delete();
                }
            }
        });

        static::restoring(function ($folder) {
            MediaFile::where('folder_id', $folder->id)->restore();
        });
    }
}
