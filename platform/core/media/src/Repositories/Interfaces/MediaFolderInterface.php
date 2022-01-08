<?php

namespace Botble\Media\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface MediaFolderInterface extends RepositoryInterface
{

    /**
     * @param int $folderId
     * @param array $params
     * @param bool $withTrash
     * @return mixed
     */
    public function getFolderByParentId($folderId, array $params = [], $withTrash = false);

    /**
     * @param string $name
     * @param int $parentId
     * @return string
     */
    public function createSlug($name, $parentId);

    /**
     * @param string $name
     * @param int $parentId
     */
    public function createName($name, $parentId);

    /**
     * @param int $parentId
     * @param array $breadcrumbs
     * @return array
     */
    public function getBreadcrumbs($parentId, $breadcrumbs = []);

    /**
     * @param int $parentId
     * @param array $params
     * @return mixed
     */
    public function getTrashed($parentId, array $params = []);

    /**
     * @param int $folderId
     * @param bool $force
     */
    public function deleteFolder($folderId, $force = false);

    /**
     * @param int $parentId
     * @param array $child
     * @return array
     */
    public function getAllChildFolders($parentId, $child = []);

    /**
     * @param int $folderId
     * @param string $path
     * @return string
     */
    public function getFullPath($folderId, $path = '');

    /**
     * @param int $folderId
     */
    public function restoreFolder($folderId);

    /**
     * @return bool
     */
    public function emptyTrash();
}
