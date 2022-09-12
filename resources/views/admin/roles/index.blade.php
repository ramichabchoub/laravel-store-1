<x-dashboard-layout title="Roles" subtitle="Sub title">
   
    <div class="table-toolbar mb-3">
        <a href="{{ route('admin.roles.create') }}" class="btn btn-info">Create</a>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Abilities</th>
                <th>Created At</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            @foreach ($roles as $role)
            <tr>
                <td>{{ $role->id }}</td>
                <td><a href="{{ route('admin.roles.edit', $role->id) }}">{{ $role->name }}</a></td>
                <td>{{count($role->abilities) }}</td>
                <td>{{ $role->created_at }}</td>
                <td>
                    <form action="{{ route('admin.roles.destroy', $role->id) }}" method="post">
                        @csrf
                        @method('delete')
                        <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

</x-dashboard-layout>