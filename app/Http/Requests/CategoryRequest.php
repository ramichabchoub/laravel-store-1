<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CategoryRequest extends FormRequest
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
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $id = $this->route('id');
        
        return [
            'name' => [
                'required',
                'string',
                'max:255',
                'min:3',
                //"unique:categories,name,$id",
                //(new Unique('categories', 'name'))->ignore($id),
                Rule::unique('categories', 'name')->ignore($id),
            ],
            'description' => [
                'required',
                'min:5',
                /*function($attribute, $value, $fail) {
                    if (strpos($value, 'laravel') !== false) {
                        $fail('You can not use the word "laravel"!');
                    }
                },*/
                //new WordsFilter(['php', 'laravel']),
                'filter:laravel,php'
            ],
            'parent_id' => [
                'nullable',
                'exists:categories,id'
            ],
            'image' => [
                'nullable',
                'image',
                'max:1048576',
                'dimensions:min_width=200,min_height=200'
            ],
            'status' => 'required|in:active,inactive',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Requird!!',
        ];
    }
}
