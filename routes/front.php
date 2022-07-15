<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Front\HomeController;
use App\Http\Controllers\Front\EnrollController;

Route::get('/', [HomeController::class, 'index'])->name('/');
Route::get('/course-details/{id}', [HomeController::class, 'details'])->name('course.details');
Route::post('/course-enroll', [EnrollController::class, 'enroll'])->name('enroll.course');
