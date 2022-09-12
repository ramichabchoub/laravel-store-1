<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;

class DeviceTokensController extends Controller
{
    public function store(Request $request)
    {
        $user = Auth::guard('sanctum')->user();
        $exists = $user->deviceTokens()
            ->where('token', '=', $request->post('token'))
            ->exists();
        if (!$exists) {
            $user->deviceTokens()->create([
                'token' => $request->post('token'),
                'device' => $request->post('device'),
            ]);
        }

        return Response::json([]);
    }
}
