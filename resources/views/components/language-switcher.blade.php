<div class="btn-group ps-dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Language<i class="fa fa-angle-down"></i></a>
    <ul class="dropdown-menu">
        @foreach ($locales as $code => $locale)
        <li><a href="{{ LaravelLocalization::getLocalizedURL($code) }}">{{ $locale['name'] }}</a></li>
        @endforeach
    </ul>
</div>