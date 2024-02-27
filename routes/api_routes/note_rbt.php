<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Notes\NoteRbtController;

Route::get('note_rbt', [NoteRbtController::class, 'index'])->name('index');
Route::get('note_rbt/config', [NoteRbtController::class, 'config'])->name('config');
Route::get('note_rbt/show/{id}', [NoteRbtController::class, 'show'])->name('show');
Route::get('note_rbt/byprofile/{patient_id}', [NoteRbtController::class, 'showByPatientId'])->name('showByPatientId');

Route::post('note_rbt/store', [NoteRbtController::class, 'store'])->name('store');
Route::post('note_rbt/update/{id}', [NoteRbtController::class, 'update'])->name('update');
Route::delete('note_rbt/destroy/{id}', [NoteRbtController::class, 'destroy'])->name('destroy');

Route::post('note_rbt/storeReplacemts', [NoteRbtController::class, 'storeReplacemts'])->name('storeReplacemts');