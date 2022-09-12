<?php

namespace App\View\Components;

use Illuminate\View\Component;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class LanguageSwitcher extends Component
{
    public $locales;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->locales = LaravelLocalization::getSupportedLocales();
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.language-switcher');
    }
}
