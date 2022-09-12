<x-dashboard-layout title="Products">

    <x-alert />
    
    <div class="table-toolbar mb-3">
        <a href="{{ route('admin.products.create') }}" class="btn btn-info">Create</a>
        <a href="{{ route('admin.products.export', request()->query()) }}" class="btn btn-dark">Export</a>
        <a href="{{ route('admin.products.import') }}" class="btn btn-success">Import</a>
    </div>

    <form action="{{ URL::current() }}" method="get" class="d-flex mb-4">
        <input type="text" name="name" class="form-control me-2" placeholder="Search by name">
        <select name="category_id" class="form-control me-2">
            <option value="">All Categories</option>
            @foreach ($categories as $category)
            <option value="{{ $category->id }}">{{ $category->name }}</option>
            @endforeach
        </select>
        <button type="submit" class="btn btn-secondary">Filter</button>
    </form>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Created At</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
            <tr>
                <td>{{ $product->id }}</td>
                <td><a href="{{ route('admin.products.edit', $product->id) }}">{{ $product->name }}</a></td>
                <td>{{ $product->category->name }}</td>
                <td>{{ $product->price }}</td>
                <td>{{ $product->quantity }}</td>
                <td>{{ $product->status }}</td>
                <td>{{ $product->created_at }}</td>
                <td>
                    <form action="{{ route('admin.products.destroy', $product->id) }}" method="post">
                        @csrf
                        @method('delete')
                        <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    {{ $products->links() }}

</x-dashboard-layout>