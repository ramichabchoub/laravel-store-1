<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\VerifyEmailController;
use Illuminate\Support\Facades\Route;

Route::get('/register', [RegisteredUserController::class, 'create'])
                ->middleware('guest:web,store')
                ->name('register');

Route::post('/register', [RegisteredUserController::class, 'store'])
                ->middleware('guest:web,store');

Route::get('{guard}/login', [AuthenticatedSessionController::class, 'create'])
                ->middleware('guest:web,store')
                ->name('login');

Route::post('{guard}/login', [AuthenticatedSessionController::class, 'store'])
                ->middleware('guest:web,store');

Route::get('{guard}/forgot-password', [PasswordResetLinkController::class, 'create'])
                ->middleware('guest:web,store')
                ->name('password.request');

Route::post('{guard}/forgot-password', [PasswordResetLinkController::class, 'store'])
                ->middleware('guest:web,store')
                ->name('password.email');

Route::get('{guard}/reset-password/{token}', [NewPasswordController::class, 'create'])
                ->middleware('guest:web,store')
                ->name('password.reset');

Route::post('{guard}/reset-password', [NewPasswordController::class, 'store'])
                ->middleware('guest:web,store')
                ->name('password.update');

Route::get('{guard}/verify-email', [EmailVerificationPromptController::class, '__invoke'])
                ->middleware('auth:web,store')
                ->name('verification.notice');

Route::get('{guard}/verify-email/{id}/{hash}', [VerifyEmailController::class, '__invoke'])
                ->middleware(['auth:web,store', 'signed', 'throttle:6,1'])
                ->name('verification.verify');

Route::post('{guard}/email/verification-notification', [EmailVerificationNotificationController::class, 'store'])
                ->middleware(['auth:web,store', 'throttle:6,1'])
                ->name('verification.send');

Route::get('{guard}/confirm-password', [ConfirmablePasswordController::class, 'show'])
                ->middleware('auth:web,store')
                ->name('password.confirm');

Route::post('{guard}/confirm-password', [ConfirmablePasswordController::class, 'store'])
                ->middleware('auth:web,store');

Route::post('{guard}/logout', [AuthenticatedSessionController::class, 'destroy'])
                ->middleware('auth:web,store')
                ->name('logout');
