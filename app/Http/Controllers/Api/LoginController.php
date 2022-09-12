<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;

class LoginController extends Controller
{
    //
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
            'device_name' => '',
        ]);

        $user = User::where('email', $request->email)->first();

        if ($user && Hash::check($request->password, $user->password)) {
            // Laravel Sanctum
            $device = $request->input('device_name', $request->userAgent());
            $token = $user->createToken($device, ['products.create', 'products.update']);

            return Response::json([
                'token' => $token->plainTextToken,
            ]);
        }

        return Response::json([
            'message' => 'Invalid email and password combination.',
        ], 401);
    }

    public function logout(Request $request)
    {
        $user = Auth::guard('sanctum')->user();
        // Logout from current device
        $user->currentAccessToken()->delete();

        // Logout out form all devices
        //$user->tokens()->delete();

        return Response::json([
            'message' => 'Token deleted',
        ]);
    }
}
