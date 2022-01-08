<?php

namespace Botble\Media\Http\Resources;

use BaseHelper;
use Botble\Media\Models\MediaFile;
use File;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use RvMedia;

/**
 * @mixin MediaFile
 */
class FileResource extends JsonResource
{
    /**
     * @param Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'         => $this->id,
            'name'       => $this->name,
            'basename'   => File::basename($this->url),
            'url'        => $this->url,
            'full_url'   => RvMedia::url($this->url),
            'type'       => $this->type,
            'icon'       => $this->icon,
            'thumb'      => $this->canGenerateThumbnails() ? RvMedia::getImageUrl($this->url, 'thumb') : null,
            'size'       => $this->human_size,
            'mime_type'  => $this->mime_type,
            'created_at' => BaseHelper::formatDate($this->created_at, 'Y-m-d H:i:s'),
            'updated_at' => BaseHelper::formatDate($this->updated_at, 'Y-m-d H:i:s'),
            'options'    => $this->options,
            'folder_id'  => $this->folder_id,
        ];
    }
}
