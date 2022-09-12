<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Models\Category;
use App\Models\User;
use App\Rules\WordsFilter;
use App\Scopes\ActiveStatusScope;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Unique;

class CategoriesController extends Controller
{

    public function index(Request $request)
    {
        $this->authorize('view-any', Category::class);

        $categories = Category::when($request->name, function($query, $value) {
                $query->where(function($query) use ($value) {
                    $query->where('categories.name', 'LIKE', "%{$value}%")
                        ->orWhere('categories.description', 'LIKE', "%{$value}%");
                });
            })
            ->when($request->parent_id, function($query, $value) {
                $query->where('categories.parent_id', '=', $value);
            })
            /*->leftJoin('categories as parents', 'parents.id', '=', 'categories.parent_id')
            ->select([
                'categories.*',
                'parents.name as parent_name'
            ])*/
            // Eager loading
            ->with('parent')
            ->withoutGlobalScope(ActiveStatusScope::class)
            ->get();
        
        // SELECT * FROM categories
        // SELECT * FROM categories WHERE id IN (....)

        $names = [];
        $data = [];
        foreach ($categories as $category) {
            if (in_array($category->name, $names)) {
                continue;
            }
            $data[] = $category;
            $names[] = $category->name;
        }

        /*$query = Category::query();
        if ($request->name) {
            $query->where(function($query) use ($request) {
                $query->where('name', 'LIKE', "%{$request->name}%")
                    ->orWhere('description', 'LIKE', "%{$request->name}%");
            });
        }
        if ($request->parent_id) {
            $query->where('parent_id', '=', $request->parent_id);
        }
        $categories = $query->get();*/


        $parents = Category::orderBy('name', 'asc')->get();
        return view('admin.categories.index', [
            'categories' => $categories,
            'parents' => $parents,
        ]);
    }

    public function create()
    {
        $this->authorize('create', Category::class);

        $parents = Category::orderBy('name', 'asc')->get();
        return view('admin.categories.create', [
            'parents' => $parents,
            'title' => 'Add Category',
            'category' => new Category(),
        ]);
    }

    public function store(CategoryRequest $request)
    {
        $this->authorize('create', Category::class);

        $clean = $this->validateRequest($request);

        $category = new Category();
        $category->name = $request->name; // $request->get('name')
        $category->slug = Str::slug($clean['name']);
        $category->description = $clean['description'];
        $category->parent_id = $request->post('parent_id');
        $category->status = $request->post('status');
        $category->save();

        session()->put('status', 'Category added (from status!)');

        session()->flash('success', 'Category added!');
        return redirect( route('admin.categories.index') );
    }

    public function show($id)
    {
        $category = Category::findOrFail($id);
        $this->authorize('view', $category);
        
        return view('admin.categories.show', [
            'category' => $category,
        ]);
    }

    public function edit($id)
    {
        //$category = Category::where('id', '=', $id)->first();
        $category = Category::findOrFail($id);
        $this->authorize('update', $category);

        $parents = Category::where('id', '<>', $id)
            ->orderBy('name', 'asc')
            ->get();

        return view('admin.categories.edit', [
            'id' => $id,
            'category' => $category,
            'parents' => $parents,
        ]);
    }

    public function update(CategoryRequest $request, $id)
    {
        $category = Category::find($id);
        if ($category == null) {
            abort(404);
        }
        $this->authorize('update', $category);

        //$this->validateRequest($request, $id);

        $category->name = $request->name; // $request->get('name')
        $category->slug = Str::slug($request->name);
        $category->description = $request->input('description');
        $category->parent_id = $request->post('parent_id');
        $category->status = $request->post('status');
        $category->save();

        return redirect()
            ->route('admin.categories.index')
            ->with('success', 'Category updated');
    }

    public function destroy($id)
    {
        // Method 1
        $category = Category::findOrFail($id);
        $this->authorize('delete', $category);
        $category->delete();

        // Method 2
        //Category::where('id', '=', $id)->delete();

        // Method 3
        //Category::destroy($id);

        return redirect()
            ->route('admin.categories.index')
            ->with('success', 'Category deleted');

    }

    public function trash()
    {
        return view('admin.categories.trash', [
            'categories' => Category::onlyTrashed()->paginate(),
        ]);
    }

    public function restore($id)
    {
        $category = Category::onlyTrashed()->findOrFail($id);
        $category->restore();
        return redirect()
            ->route('admin.categories.trash')
            ->with('success', 'Category restored');
    }

    public function forceDelete($id)
    {
        $category = Category::onlyTrashed()->findOrFail($id);
        $category->forceDelete();
        return redirect()
            ->route('admin.categories.trash')
            ->with('success', 'Category deleted forever.');
    }

    protected function validateRequest(Request $request, $id = 0)
    {
        return $request->validate([
            'name' => [
                'required',
                'string',
                'max:255',
                'min:3',
                //"unique:categories,name,$id",
                //(new Unique('categories', 'name'))->ignore($id),
                Rule::unique('categories', 'name')->ignore($id),
            ],
            'description' => [
                'required',
                'min:5',
                /*function($attribute, $value, $fail) {
                    if (strpos($value, 'laravel') !== false) {
                        $fail('You can not use the word "laravel"!');
                    }
                },*/
                //new WordsFilter(['php', 'laravel']),
                'filter:laravel,php'
            ],
            'parent_id' => [
                'nullable',
                'exists:categories,id'
            ],
            'image' => [
                'nullable',
                'image',
                'max:1048576',
                'dimensions:min_width=200,min_height=200'
            ],
            'status' => 'required|in:active,inactive',
        ], [
            'name.required' => 'هذا الحقل مطلوب :attribute',
        ]);

        //$request->validate(Category::rules());
        /*$this->validate($request, [
            'name' => 'required|string|max:255|min:3|unique:categories,name',
            'description' => 'nullable|min:5',
            'parent_id' => [
                'nullable',
                'exists:categories,id'
            ],
            'image' => [
                'nullable',
                'image',
                'max:1048576',
                'dimensions:min_width=200,min_height=200'
            ],
            'status' => 'required|in:active,inactive',
        ]);

        $request->validate([
            'name' => 'required|alpha|max:255|min:3|unique:categories,name',
            'description' => 'nullable|min:5',
            'parent_id' => [
                'nullable',
                'exists:categories,id'
            ],
            'image' => [
                'nullable',
                'image',
                'max:1048576',
                'dimensions:min_width=200,min_height=200'
            ],
            'status' => 'required|in:active,inactive',
        ]);

        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required|alpha|max:255|min:3|unique:categories,name',
                'description' => 'nullable|min:5',
                'parent_id' => [
                    'nullable',
                    'exists:categories,id'
                ],
                'image' => [
                    'nullable',
                    'image',
                    'max:1048576',
                    'dimensions:min_width=200,min_height=200'
                ],
                'status' => 'required|in:active,inactive',
            ]
        );

        $result = $validator->fails(); // true when validation failed
        $failed = $validator->failed();
        $errors = $validator->errors();

        //$clean = $validator->validated();
        $clean = $validator->validate();
        dd($clean);
        */

        /*if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }*/
    }

    public function storeProduct(Request $request, $id)
    {
        $category = Category::findOrFail($id);

        $product = $category->products()->create([
            'name' => 'Product Name',
            'price' => 10,
        ]);

        //$product->category()->associate($category);
        //$product->save();
        //$product->category()->dissociate();
        //$product->save();
    }
}
