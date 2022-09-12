<x-dashboard-layout title="Edit Product">

<form action="{{ route('admin.products.update', $product->id) }}" method="post" enctype="multipart/form-data">
    @csrf
    @method('put')

    @include('admin.products._form', [
        'button_label' => 'Update'
    ])
</form>

</x-dashboard-layout>