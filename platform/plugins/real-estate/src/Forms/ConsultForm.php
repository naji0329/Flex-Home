<?php

namespace Botble\RealEstate\Forms;

use Botble\RealEstate\Models\Consult;
use Botble\Base\Forms\FormAbstract;
use Botble\RealEstate\Enums\ConsultStatusEnum;
use Botble\RealEstate\Http\Requests\ConsultRequest;
use Throwable;

class ConsultForm extends FormAbstract
{

    /**
     * @return mixed|void
     * @throws Throwable
     */
    public function buildForm()
    {
        $this
            ->setupModel(new Consult)
            ->setValidatorClass(ConsultRequest::class)
            ->withCustomFields()
            ->add('status', 'customSelect', [
                'label'      => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'class' => 'form-control select-full',
                ],
                'choices'    => ConsultStatusEnum::labels(),
            ])
            ->addMetaBoxes([
                'information' => [
                    'title'      => trans('plugins/real-estate::consult.consult_information'),
                    'content'    => view('plugins/real-estate::info', ['consult' => $this->getModel()])->render(),
                    'attributes' => [
                        'style' => 'margin-top: 0',
                    ],
                ],
            ])
            ->setBreakFieldPoint('status');
    }
}
