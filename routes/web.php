<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Admin\DashboardController;

use App\Http\Controllers\Admin\UserController;

use App\Http\Controllers\Admin\AdminController;

use App\Http\Controllers\Admin\CourseController;

use App\Http\Controllers\Front\HomeController;

use App\Http\Controllers\Front\EnrollController;



Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'dashboard'])->name('dashboard');


    Route::middleware('is_admin')->group(function (){
        Route::resource('users', UserController::class);
        Route::get('/user-change-status/{id}', [AdminController::class, 'changeStatus'])->name('users.change-status');
        Route::get('/manage-enroll', [AdminController::class, 'manageEnroll'])->name('manage.enroll');
        Route::get('/change-status/{id}', [AdminController::class, 'enrollChangeStatus'])->name('change.status');
        Route::get('/delete-enroll/{id}', [EnrollController::class, 'delete'])->name('delete.enroll');

    });

    Route::middleware('is_admin_teacher')->group(function () {
        Route::resource('courses', CourseController::class);
        Route::get('/course-change-status/{id}', [AdminController::class, 'courseChangeStatus'])->name('courses.change-status');
    });

    Route::middleware('is_student_teacher')->group(function (){
        Route::get('/edit-profile', [DashboardController::class, 'editProfile'])->name('edit.profile');
        Route::post('/update-profile', [DashboardController::class, 'updateProfile'])->name('update.profile');
    });


});
