<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\BipController;

Route::get('bip', [BipController::class, 'index'])->name('index');
Route::get('bip/show/{id}', [BipController::class, 'show'])->name('show');
Route::get('bip/config', [BipController::class, 'config'])->name('config');
Route::get('bip/profile/{id}', [BipController::class, 'showProfile'])->name('showProfile');
Route::post('bip/store', [BipController::class, 'store'])->name('store');
Route::post('bip/update/{id}', [BipController::class, 'update'])->name('update');

Route::get('bip/show/byuser/{id}', [BipController::class, 'showbyUser'])->name('showbyUser');
Route::delete('bip/destroy/{id}', [BipController::class, 'destroy'])->name('destroy');

Route::put('/bip/update/eligibility/{bip:id}', [BipController::class, 'updateEligibility'])
    ->name('bip.updateEligibility');
