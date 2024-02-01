<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Patient\PatientController;

Route::get('patients', [PatientController::class, 'index'])->name('index');
Route::get('patients/all', [PatientController::class, 'all'])->name('all');
Route::get('patients/profile/{id}', [PatientController::class, 'profile'])->name('profile');
Route::get('patients/config', [PatientController::class, 'config'])->name('config');
Route::post('patients/store', [PatientController::class, 'store'])->name('store');
Route::get('patients/show/{id}', [PatientController::class, 'show'])->name('show');
Route::post('patients/update/{patient}', [PatientController::class, 'update'])->name('update');
Route::post('patients/patientupdate/{patient}', [PatientController::class, 'patientUpdate'])->name('patientUpdate');
Route::delete('patients/destroy/{id}', [PatientController::class, 'destroy'])->name('destroy');

Route::put('/patients/update/eligibility/{patient:id}', [PatientController::class, 'updateEligibility'])
    ->name('patients.updateEligibility');
