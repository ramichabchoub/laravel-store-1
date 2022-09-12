<x-dashboard-layout title="Import Products">

    <form action="{{ route('admin.products.import') }}" method="post" enctype="multipart/form-data">
        @csrf

        <div class="form-group mb-3">
            <label for="">Excel File:</label>
            <input type="file" name="file" class="form-control @error('file') is-invalid @enderror">
            @error('file')
            <p class="invalid-feedback">{{ $message }}</p>
            @enderror
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Import</button>
        </div>
    </form>

</x-dashboard-layout>