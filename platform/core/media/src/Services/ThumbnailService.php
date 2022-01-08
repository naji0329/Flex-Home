<?php

namespace Botble\Media\Services;

use Exception;
use Intervention\Image\ImageManager;
use Log;

class ThumbnailService
{

    /**
     * @var ImageManager
     */
    protected $imageManager;

    /**
     * @var string
     */
    protected $imagePath;

    /**
     * @var float
     */
    protected $thumbRate;

    /**
     * @var int
     */
    protected $thumbWidth;

    /**
     * @var int
     */
    protected $thumbHeight;

    /**
     * @var string
     */
    protected $destinationPath;

    /**
     * @var string
     */
    protected $xCoordinate;

    /**
     * @var string
     */
    protected $yCoordinate;

    /**
     * @var string
     */
    protected $fitPosition;

    /**
     * @var string
     */
    protected $fileName;

    /**
     * @var UploadsManager
     */
    protected $uploadManager;

    /**
     * ThumbnailService constructor.
     * @param UploadsManager $uploadManager
     * @param ImageManager $imageManager
     */
    public function __construct(UploadsManager $uploadManager, ImageManager $imageManager)
    {
        $this->thumbRate = 0.75;
        $this->xCoordinate = null;
        $this->yCoordinate = null;
        $this->fitPosition = 'center';

        $driver = 'gd';
        if (extension_loaded('imagick')) {
            $driver = 'imagick';
        }

        $this->imageManager = $imageManager->configure(compact('driver'));
        $this->uploadManager = $uploadManager;
    }

    /**
     * @param string $imagePath
     * @return ThumbnailService
     */
    public function setImage($imagePath)
    {
        $this->imagePath = $imagePath;

        return $this;
    }

    /**
     * @return string
     */
    public function getImage()
    {
        return $this->imagePath;
    }

    /**
     * @param int|string $width
     * @param int|string $height
     * @return ThumbnailService
     */
    public function setSize($width, $height = 'auto')
    {
        $this->thumbWidth = $width;
        $this->thumbHeight = $height;

        if (!$height || $height == 'auto') {
            $this->thumbHeight = 0;
        } elseif ($height == 'rate') {
            $this->thumbHeight = (int)($this->thumbWidth * $this->thumbRate);
        }

        if (!$width || $width == 'auto') {
            $this->thumbWidth = 0;
        } elseif ($width == 'rate') {
            $this->thumbWidth = (int)($this->thumbHeight * $this->thumbRate);
        }

        return $this;
    }

    /**
     * @return array
     */
    public function getSize()
    {
        return [$this->thumbWidth, $this->thumbHeight];
    }

    /**
     * @param string $destinationPath
     * @return ThumbnailService
     */
    public function setDestinationPath($destinationPath)
    {
        $this->destinationPath = $destinationPath;

        return $this;
    }

    /**
     * @param int $xCoordination
     * @param int $yCoordination
     * @return ThumbnailService
     */
    public function setCoordinates($xCoordination, $yCoordination)
    {
        $this->xCoordinate = $xCoordination;
        $this->yCoordinate = $yCoordination;

        return $this;
    }

    /**
     * @return array
     */
    public function getCoordinates()
    {
        return [$this->xCoordinate, $this->yCoordinate];
    }

    /**
     * @param string $fileName
     * @return ThumbnailService
     */
    public function setFileName($fileName)
    {
        $this->fileName = $fileName;

        return $this;
    }

    /**
     * @return string
     */
    public function getFileName()
    {
        return $this->fileName;
    }

    /**
     * @param string $type
     * @return bool|string
     */
    public function save($type = 'fit')
    {
        $fileName = pathinfo($this->imagePath, PATHINFO_BASENAME);

        if ($this->fileName) {
            $fileName = $this->fileName;
        }

        $destinationPath = sprintf('%s/%s', trim($this->destinationPath, '/'), $fileName);

        $thumbImage = $this->imageManager->make($this->imagePath);

        if ($this->thumbWidth && !$this->thumbHeight) {
            $type = 'width';
        } elseif ($this->thumbHeight && !$this->thumbWidth) {
            $type = 'height';
        }

        switch ($type) {
            case 'width':
                $thumbImage->resize($this->thumbWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                });
                break;

            case 'height':
                $thumbImage->resize(null, $this->thumbHeight, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                });
                break;

            case 'resize':
                $thumbImage->resize($this->thumbWidth, $this->thumbHeight);
                break;

            case 'crop':
                $thumbImage->crop($this->thumbWidth, $this->thumbHeight, $this->xCoordinate, $this->yCoordinate);
                break;

            case 'fit':
            default:
                $thumbImage->fit($this->thumbWidth, $this->thumbHeight, null, $this->fitPosition);
                break;
        }

        try {
            $this->uploadManager->saveFile($destinationPath, $thumbImage->stream()->__toString());
        } catch (Exception $exception) {
            Log::error($exception->getMessage());
            return false;
        }

        return $destinationPath;
    }
}
