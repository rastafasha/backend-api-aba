<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\BipController;

Route::get('bip', [BipController::class, 'index'])->name('index');
Route::get('bip/profile/{id}', [BipController::class, 'showbyProfile'])->name('showbyProfile');
Route::get('bip/config', [BipController::class, 'config'])->name('config');
Route::post('bip/store', [BipController::class, 'store'])->name('store');
Route::get('bip/show/{id}', [BipController::class, 'show'])->name('show');
Route::post('bip/update/{bip}', [BipController::class, 'update'])->name('update');
Route::delete('bip/destroy/{id}', [BipController::class, 'destroy'])->name('destroy');

Route::put('/bip/update/eligibility/{bip:id}', [BipController::class, 'updateEligibility'])
    ->name('bip.updateEligibility');
