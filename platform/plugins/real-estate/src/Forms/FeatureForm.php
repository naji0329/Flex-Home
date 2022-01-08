<?php

namespace Botble\RealEstate\Forms;

use Botble\Base\Forms\FormAbstract;
use Botble\RealEstate\Http\Requests\FeatureRequest;
use Botble\RealEstate\Models\Feature;
use Throwable;

class FeatureForm extends FormAbstract
{

    /**
     * @return mixed|void
     * @throws Throwable
     */
    public function buildForm()
    {
        $this
            ->setupModel(new Feature)
            ->setValidatorClass(FeatureRequest::class)
            ->add('name', 'text', [
                'label'      => trans('plugins/real-estate::feature.form.name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('plugins/real-estate::feature.form.name'),
                    'data-counter' => 120,
                ],
            ])
            ->add('icon', 'text', [
                'label'         => trans('plugins/real-estate::feature.form.icon'),
                'label_attr'    => ['class' => 'control-label'],
                'attr'          => [
                    'placeholder'  => trans('plugins/real-estate::feature.form.icon'),
                    'data-counter' => 60,
                ],
                'default_value' => 'fas fa-check',
            ]);
    }
}
