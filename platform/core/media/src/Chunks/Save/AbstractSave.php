<?php

namespace Botble\Media\Chunks\Save;

use Botble\Media\Chunks\Handler\AbstractHandler;
use Illuminate\Http\UploadedFile;

abstract class AbstractSave
{
    /**
     * @var UploadedFile
     */
    protected $file;

    /**
     * @var AbstractHandler
     */
    private $handler;

    /**
     * AbstractUpload constructor.
     *
     * @param UploadedFile $file the uploaded file (chunk file)
     * @param AbstractHandler $handler the handler that detected the correct save method
     */
    public function __construct(UploadedFile $file, AbstractHandler $handler)
    {
        $this->file = $file;
        $this->handler = $handler;
    }

    /**
     * Checks if the file upload is finished.
     *
     * @return bool
     */
    public function isFinished()
    {
        return $this->isValid();
    }

    /**
     * Checks if the upload is valid.
     *
     * @return bool
     */
    public function isValid()
    {
        return $this->file->isValid();
    }

    /**
     * Returns the error message.
     *
     * @return string
     */
    public function getErrorMessage()
    {
        return $this->file->getErrorMessage();
    }

    /**
     * Passes all the function into the file.
     *
     * @param string $name
     * @param array $arguments
     * @return mixed
     */
    public function __call($name, $arguments)
    {
        return call_user_func_array([$this->getFile(), $name], $arguments);
    }

    /**
     * @return UploadedFile
     */
    public function getFile()
    {
        return $this->file;
    }

    /**
     * @return AbstractHandler
     */
    public function handler()
    {
        return $this->handler;
    }
}
