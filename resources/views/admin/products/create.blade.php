<x-dashboard-layout title="Add Product">

    <form action="{{ route('admin.products.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        
        @include('admin.products._form', [
            'button_label' => 'Add'
        ])
    </form>

</x-dashboard-layout>