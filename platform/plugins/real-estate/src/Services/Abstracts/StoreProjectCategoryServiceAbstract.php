<?php

namespace Botble\RealEstate\Services\Abstracts;

use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Repositories\Interfaces\CategoryInterface;
use Illuminate\Http\Request;

abstract class StoreProjectCategoryServiceAbstract
{
    /**
     * @var CategoryInterface
     */
    protected $categoryRepository;

    /**
     * StoreProjectCategoryServiceAbstract constructor.
     * @param CategoryInterface $categoryRepository
     */
    public function __construct(CategoryInterface $categoryRepository)
    {
        $this->categoryRepository = $categoryRepository;
    }

    /**
     * @param Request $request
     * @param Project $project
     * @return mixed
     */
    abstract public function execute(Request $request, Project $project);
}
