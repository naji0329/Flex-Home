<?php

namespace Botble\RealEstate\Http\Requests;

use Botble\RealEstate\Enums\TransactionTypeEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CreateTransactionRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'credits' => 'required|numeric|min:1',
            'type'    => Rule::in(TransactionTypeEnum::values()),
        ];
    }
}
