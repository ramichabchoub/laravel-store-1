<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationsController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        foreach ($user->notifications as $notification) {
            echo $notification->data['body'];
            echo $notification->created_at->diffForHumans();            
        }
    }
}
