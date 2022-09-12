<x-dashboard-layout title="Edit Category">

<form action="{{ route('admin.categories.update', $id) }}" method="post" enctype="multipart/form-data">
    @csrf
    @method('put')

    @include('admin.categories._form', [
        'button_label' => 'Update'
    ])
</form>

</x-dashboard-layout>