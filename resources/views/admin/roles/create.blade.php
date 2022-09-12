<x-dashboard-layout title="Add Category">

    <form action="{{ route('admin.roles.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        
        @include('admin.roles._form', [
            'button_label' => 'Add'
        ])
    </form>

</x-dashboard-layout>