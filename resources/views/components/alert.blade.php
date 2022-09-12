@if (isset($title))
<div class="alert alert-{{ $type ?? 'info' }}">
    <h4>{{ $title }}</h4>
    <p class="fs-5">{{ $slot }}</p>
    {{ $actions }}
    {{ $url }}
</div>
@endif

@if (session()->has('success'))
<div class="alert alert-success">
    {{ session()->get('success') }}
</div>
@endif

@if (session()->has('error'))
<div class="alert alert-danger">
    {{ session()->get('error') }}
</div>
@endif

@if (session()->has('warning'))
<div class="alert alert-warning">
    {{ session()->get('warning') }}
</div>
@endif

@if (session()->has('info'))
<div class="alert alert-info">
    {{ session()->get('info') }}
</div>
@endif