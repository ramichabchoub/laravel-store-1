<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    
    public function show($id)
    {
        $user = User::findOrFail($id);
        return $user->profile->first_name;
    }

    public function profile(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $profile = $user->profile()->create([]);

        $profile = new Profile([]);

        $profile->user()->associate($user);
        $profile->save();
        // update profiles set user_id = $user->id WHERE id = $profile->id

        $profile->user()->dissociate();
        $profile->save();
        // update profiles set user_id = null WHERE id = $profile->id

        

    }
}
