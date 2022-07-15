<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Enroll;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    protected static $existEnroll;
    protected static $hasEnroll = false;

    public function index()
    {
        return view('front.home.home', [
            'courses' => Course::latest()->get(),
        ]);
    }

    public function details ($id)
    {
        self::$existEnroll = Enroll::where('course_id', $id)->where('user_id', Auth::id())->first();
        if (isset(self::$existEnroll))
        {
            self::$hasEnroll = true;
        }
        return view('front.course.details', [
            'course' => Course::find($id),
            'hasEnroll' => self::$hasEnroll,
        ]);
    }
}
