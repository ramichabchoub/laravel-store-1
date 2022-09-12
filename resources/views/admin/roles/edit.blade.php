<x-dashboard-layout title="Edit Category">

<form action="{{ route('admin.roles.update', $role->id) }}" method="post" enctype="multipart/form-data">
    @csrf
    @method('put')

    @include('admin.roles._form', [
        'button_label' => 'Update'
    ])
</form>

</x-dashboard-layout>