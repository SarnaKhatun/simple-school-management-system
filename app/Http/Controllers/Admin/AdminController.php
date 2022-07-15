<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Enroll;
use App\Models\UserDetail;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    protected static $user;
    protected static $userDetails;
    public function changeStatus ($id)
    {
        self::$userDetails = UserDetail::where('user_id', $id)->first();
        if (self::$userDetails->status == 1)
        {
            self::$userDetails->status = 0;
        }
        elseif (self::$userDetails->status == 0)
        {
            self::$userDetails->status = 1;
        }
        self::$userDetails->save();
        return back()->with('message', 'User status changed successfully');
    }

    public function courseChangeStatus($id)
    {
        $course = Course::where('id', $id)->first();
        if ($course->status == 1)
        {
            $course->status = 0;
        }
        elseif ($course->status == 0)
        {
            $course->status = 1;
        }
        $course->save();
        return back()->with('message', 'Course status changed successfully');
    }


    public function enrollChangeStatus ($id)
    {
        $enroll = Enroll::where('id', $id)->first();
        if ($enroll->payment_status == 'pending')
        {
            $enroll->payment_status = 'complete';
        }
        elseif ($enroll->payment_status == 'complete')
        {
            $enroll->payment_status = 'pending';
        }
        $enroll->save();
        return redirect()->back()->with('message', 'Enroll status changed successfully');
    }

    public function manageEnroll ()
    {
        return view('admin.enroll.manage', [
            'enrolls' => Enroll::latest()->get(),
        ]);
    }
}
