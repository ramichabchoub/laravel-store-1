<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class WordsFilter implements Rule
{

    protected $words;

    protected $invalid;

    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($words)
    {
        $this->words = $words;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        foreach ($this->words as $word) {
            if (stripos($value, $word) !== false) {
                $this->invalid = $word;
                return false;
            }
        }

        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'You can not use the word "' . $this->invalid . '" -- by Rule Class!';
    }
}
