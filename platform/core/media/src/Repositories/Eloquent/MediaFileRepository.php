<?php

namespace Botble\Media\Repositories\Eloquent;

use Botble\Media\Repositories\Interfaces\MediaFileInterface;
use Botble\Media\Repositories\Interfaces\MediaFolderInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Eloquent;
use Exception;
use File;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use RvMedia;

/**
 * @since 19/08/2015 07:45 AM
 */
class MediaFileRepository extends RepositoriesAbstract implements MediaFileInterface
{
    /**
     * {@inheritDoc}
     */
    public function createName($name, $folder)
    {
        $index = 1;
        $baseName = $name;
        while ($this->checkIfExistsName($name, $folder)) {
            $name = $baseName . '-' . $index++;
        }
        return $name;
    }

    /**
     * {@inheritDoc}
     */
    protected function checkIfExistsName($name, $folder)
    {
        $count = $this->model
            ->where('name', $name)
            ->where('folder_id', $folder)
            ->withTrashed()
            ->count();

        return $count > 0;
    }

    /**
     * {@inheritDoc}
     */
    public function createSlug($name, $extension, $folderPath)
    {
        $slug = Str::slug($name, '-', !RvMedia::turnOffAutomaticUrlTranslationIntoLatin() ? 'en' : false);
        $index = 1;
        $baseSlug = $slug;
        while (File::exists(RvMedia::getRealPath(rtrim($folderPath, '/') . '/' . $slug . '.' . $extension))) {
            $slug = $baseSlug . '-' . $index++;
        }

        if (empty($slug)) {
            $slug = $slug . '-' . time();
        }

        return $slug . '.' . $extension;
    }

    /**
     * {@inheritDoc}
     */
    public function getFilesByFolderId($folderId, array $params = [], $withFolders = true, $folderParams = [])
    {
        $params = array_merge([
            'order_by'         => [
                'name' => 'ASC',
            ],
            'select'           => [
                'media_files.id as id',
                'media_files.name as name',
                'media_files.url as url',
                'media_files.mime_type as mime_type',
                'media_files.size as size',
                'media_files.created_at as created_at',
                'media_files.updated_at as updated_at',
                'media_files.options as options',
                'media_files.folder_id as folder_id',
                DB::raw('0 as is_folder'),
                DB::raw('NULL as slug'),
                DB::raw('NULL as parent_id'),
            ],
            'condition'        => [],
            'recent_items'     => null,
            'paginate'         => [
                'per_page'      => null,
                'current_paged' => 1,
            ],
            'selected_file_id' => null,
            'is_popup'         => false,
            'filter'           => 'everything',
            'take'             => null,
            'with'             => [],
        ], $params);

        if ($withFolders) {
            $folderParams = array_merge([
                'condition' => [],
                'select'    => [
                    'media_folders.id as id',
                    'media_folders.name as name',
                    DB::raw('NULL as url'),
                    DB::raw('NULL as mime_type'),
                    DB::raw('NULL as size'),
                    'media_folders.created_at as created_at',
                    'media_folders.updated_at as updated_at',
                    DB::raw('NULL as options'),
                    DB::raw('NULL as folder_id'),
                    DB::raw('1 as is_folder'),
                    'media_folders.slug as slug',
                    'media_folders.parent_id as parent_id',
                ],
            ], $folderParams);

            $folder = app(MediaFolderInterface::class)->getModel();

            $folder = $folder
                ->where('parent_id', $folderId)
                ->select($folderParams['select']);

            $this->applyConditions($folderParams['condition'], $folder);

            $this->model = $this->model
                ->union($folder);
        }

        if (empty($folderId)) {
            $this->model = $this->model
                ->leftJoin('media_folders', 'media_folders.id', '=', 'media_files.folder_id')
                ->where(function ($query) use ($folderId) {
                    /**
                     * @var Builder $query
                     */
                    $query
                        ->where(function ($sub) use ($folderId) {
                            /**
                             * @var Builder $sub
                             */
                            $sub
                                ->where('media_files.folder_id', $folderId)
                                ->whereNull('media_files.deleted_at');
                        })
                        ->orWhere(function ($sub) {
                            /**
                             * @var Builder $sub
                             */
                            $sub
                                ->whereNull('media_files.deleted_at')
                                ->whereNotNull('media_folders.deleted_at');
                        })
                        ->orWhere(function ($sub) {
                            /**
                             * @var Builder $sub
                             */
                            $sub
                                ->whereNull('media_files.deleted_at')
                                ->whereNull('media_folders.id');
                        });
                })
                ->withTrashed();
        } else {
            $this->model = $this->model->where('media_files.folder_id', $folderId);
        }

        if (isset($params['recent_items']) && is_array($params['recent_items']) && $params['recent_items']) {
            $this->model = $this->model->whereIn('media_files.id', Arr::get($params, 'recent_items', []));
        }

        if ($params['selected_file_id'] && $params['is_popup']) {
            $this->model = $this->model->where('media_files.id', '<>', $params['selected_file_id']);
        }

        $result = $this->getFile($params);

        if ($params['selected_file_id']) {
            if (!$params['paginate']['current_paged'] || $params['paginate']['current_paged'] == 1) {
                $currentFile = $this->originalModel;

                $currentFile = $currentFile
                    ->where('media_files.folder_id', $folderId)
                    ->where('id', $params['selected_file_id'])
                    ->select($params['select'])
                    ->first();
            }
        }

        if (isset($currentFile) && $params['is_popup']) {
            try {
                $result->prepend($currentFile);
            } catch (Exception $exception) {
                info($exception->getMessage());
            }
        }

        return $result;
    }

    /**
     * @param array $params
     * @return Eloquent[]|\Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection|Model|Model[]|Builder|Builder[]|Collection|object
     */
    protected function getFile($params)
    {
        $this->applyConditions($params['condition']);

        if ($params['filter'] != 'everything') {
            $this->model = $this->model->where(function ($query) use ($params) {
                /**
                 * @var Eloquent $query
                 */
                $allMimes = [];
                foreach (RvMedia::getConfig('mime_types') as $key => $value) {
                    if ($key == $params['filter']) {
                        return $query->whereIn('media_files.mime_type', $value);
                    }
                    $allMimes = array_unique(array_merge($allMimes, $value));
                }
                return $query->whereNotIn('media_files.mime_type', $allMimes);
            });
        }

        if ($params['select']) {
            $this->model = $this->model->select($params['select']);
        }

        foreach ($params['order_by'] as $column => $direction) {
            $this->model = $this->model->orderBy($column, $direction);
        }

        foreach ($params['with'] as $with) {
            $this->model = $this->model->with($with);
        }

        if ($params['take'] == 1) {
            $result = $this->model->first();
        } elseif ($params['take']) {
            $result = $this->model->take($params['take'])->get();
        } elseif ($params['paginate']['per_page']) {
            $paged = $params['paginate']['current_paged'] ?: 1;
            $result = $this->model
                ->skip(($paged - 1) * $params['paginate']['per_page'])
                ->limit($params['paginate']['per_page'])
                ->get();
        } else {
            $result = $this->model->get();
        }

        if (!empty($params['selected_file_id']) && !$params['paginate']['current_paged'] || $params['paginate']['current_paged'] == 1) {
            $currentFile = $this->originalModel
                ->where('id', $params['selected_file_id'])
                ->select($params['select'])
                ->first();
        }

        if (isset($currentFile) && $params['is_popup']) {
            try {
                $result->prepend($currentFile);
            } catch (Exception $exception) {
                info($exception->getMessage());
            }
        }

        $this->resetModel();

        return $result;
    }

    /**
     * {@inheritDoc}
     */
    public function getTrashed($folderId, array $params = [], $withFolders = true, $folderParams = [])
    {
        $params = array_merge([
            'order_by'  => [
                'name' => 'ASC',
            ],
            'select'    => [
                'media_files.id as id',
                'media_files.name as name',
                'media_files.url as url',
                'media_files.mime_type as mime_type',
                'media_files.size as size',
                'media_files.created_at as created_at',
                'media_files.updated_at as updated_at',
                'media_files.options as options',
                'media_files.folder_id as folder_id',
                DB::raw('0 as is_folder'),
                DB::raw('NULL as slug'),
                DB::raw('NULL as parent_id'),
            ],
            'condition' => [],
            'paginate'  => [
                'per_page'      => null,
                'current_paged' => 1,
            ],
            'filter'    => 'everything',
            'take'      => null,
            'with'      => [],
        ], $params);

        $this->model = $this->model->onlyTrashed();

        if ($withFolders) {
            $folderParams = array_merge([
                'condition' => [],
                'select'    => [
                    'media_folders.id as id',
                    'media_folders.name as name',
                    DB::raw('NULL as url'),
                    DB::raw('NULL as mime_type'),
                    DB::raw('NULL as size'),
                    'media_folders.created_at as created_at',
                    'media_folders.updated_at as updated_at',
                    DB::raw('NULL as options'),
                    DB::raw('NULL as folder_id'),
                    DB::raw('1 as is_folder'),
                    'media_folders.slug as slug',
                    'media_folders.parent_id as parent_id',
                ],
            ], $folderParams);

            $folder = app(MediaFolderInterface::class)->getModel();

            $folder = $folder
                ->withTrashed()
                ->whereNotNull('media_folders.deleted_at')
                ->select($folderParams['select']);

            if (empty($folderId)) {
                /**
                 * @var Eloquent $folder
                 */
                $folder = $folder->leftJoin('media_folders as mf_parent', 'mf_parent.id', '=',
                    'media_folders.parent_id')
                    ->where(function ($query) {
                        /**
                         * @var Eloquent $query
                         */
                        $query
                            ->orWhere('media_folders.parent_id', 0)
                            ->orWhere('mf_parent.deleted_at', null);
                    })
                    ->withTrashed();
            } else {
                $folder = $folder->where('media_folders.parent_id', $folderId);
            }

            $this->applyConditions($folderParams['condition'], $folder);

            $this->model = $this->model
                ->union($folder);
        }

        if (empty($folderId)) {
            $this->model = $this->model
                ->leftJoin('media_folders', 'media_folders.id', '=', 'media_files.folder_id')
                ->where(function ($query) {
                    /**
                     * @var Eloquent $query
                     */
                    $query
                        ->where('media_files.folder_id', 0)
                        ->orWhereNull('media_folders.deleted_at');
                });
        } else {
            $this->model = $this->model->where('media_files.folder_id', $folderId);
        }

        $result = $this->getFile($params);

        return $result;
    }

    /**
     * {@inheritDoc}
     */
    public function emptyTrash()
    {
        $files = $this->model->onlyTrashed();

        /**
         * @var Eloquent $files
         */
        $files = $files->get();

        foreach ($files as $file) {
            /**
             * @var Eloquent $file
             */
            $file->forceDelete();
        }
        return true;
    }
}
