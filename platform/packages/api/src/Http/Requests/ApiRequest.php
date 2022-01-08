<?php

namespace Botble\Api\Http\Requests;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Concerns\InteractsWithInput;
use Illuminate\Support\Arr;
use Illuminate\Validation\ValidationException;

/**
 * @mixin InteractsWithInput
 */
abstract class ApiRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Handle a failed validation attempt.
     *
     * @param Validator $validator
     * @return BaseHttpResponse|void
     *
     * @throws ValidationException
     */
    protected function failedValidation(Validator $validator)
    {
        $errors = [];

        foreach ($validator->errors()->toArray() as $key => $message) {
            $errors[] = [
                $key => Arr::first($message),
            ];
        }

        $response = (new BaseHttpResponse)
            ->setError(true)
            ->setMessage('The given data is invalid')
            ->setData($errors)
            ->setCode(422);

        throw new ValidationException($validator, $response);
    }
}
