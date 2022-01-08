<?php

namespace Botble\Career\Http\Controllers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Career\Models\Career;
use Botble\Career\Repositories\Interfaces\CareerInterface;
use Botble\SeoHelper\SeoOpenGraph;
use Botble\Slug\Repositories\Interfaces\SlugInterface;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use SeoHelper;
use SlugHelper;
use Theme;

class PublicController extends Controller
{
    /**
     * @param Request $request
     * @param CareerInterface $careerRepository
     * @return \Illuminate\Http\Response|\Response
     */
    public function careers(Request $request, CareerInterface $careerRepository)
    {
        SeoHelper::setTitle(__('Careers'));

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(__('Careers'), route('public.careers'));

        $careers = $careerRepository->advancedGet([
            'condition' => [
                'careers.status' => BaseStatusEnum::PUBLISHED,
            ],
            'paginate'  => [
                'per_page'      => 10,
                'current_paged' => (int)$request->input('page', 1),
            ],
            'order_by'  => ['careers.created_at' => 'DESC'],
        ]);

        return Theme::scope('career.careers', compact('careers'))->render();
    }

    /**
     * @param $key
     * @param CareerInterface $careerRepository
     * @param SlugInterface $slugRepository
     * @return \Illuminate\Http\Response|\Response
     * @throws \Illuminate\Contracts\Filesystem\FileNotFoundException
     */
    public function career($key, CareerInterface $careerRepository, SlugInterface $slugRepository)
    {
        $slug = $slugRepository->getFirstBy(['key' => $key, 'prefix' => SlugHelper::getPrefix(Career::class)]);

        if (!$slug) {
            abort(404);
        }

        $career = $careerRepository->getFirstBy([
            'id'     => $slug->reference_id,
            'status' => BaseStatusEnum::PUBLISHED,
        ]);

        if (!$career) {
            abort(404);
        }

        SeoHelper::setTitle(__('Careers') . ' - ' . $career->name)
            ->setDescription($career->description);

        $meta = new SeoOpenGraph;
        $meta->setDescription($career->description);
        $meta->setUrl($career->url);
        $meta->setTitle($career->name);
        $meta->setType('article');

        SeoHelper::setSeoOpenGraph($meta);

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add($career->name, $career->url);

        return Theme::scope('career.career', compact('career'))->render();
    }
}
