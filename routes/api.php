<?php

use App\Http\Controllers\Api\DeviceTokensController;
use App\Http\Controllers\Api\LoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

/*Route::resource('products', 'Api\ProductsController')->except([
    'create', 'edit'
]);*/
Route::apiResource('products', 'Api\ProductsController');

Route::post('login', [LoginController::class, 'login']);
Route::post('logout', [LoginController::class, 'logout'])->middleware('auth:sanctum');
Route::post('device-tokens', [DeviceTokensController::class, 'store'])
    ->middleware('auth:sanctum');
