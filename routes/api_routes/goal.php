<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('goal', [ReductionGoalController::class, 'index'])->name('index');
Route::get('goal/profile/{id}', [ReductionGoalController::class, 'showbyProfile'])->name('showbyProfile');
Route::get('goal/config', [ReductionGoalController::class, 'config'])->name('config');
Route::post('goal/store', [ReductionGoalController::class, 'store'])->name('store');
Route::get('goal/show/{id}', [ReductionGoalController::class, 'show'])->name('show');
Route::post('goal/update/{bip}', [ReductionGoalController::class, 'update'])->name('update');
Route::delete('goal/destroy/{id}', [ReductionGoalController::class, 'destroy'])->name('destroy');

Route::put('/goal/update/eligibility/{bip:id}', [ReductionGoalController::class, 'updateEligibility'])
    ->name('goal.updateEligibility');