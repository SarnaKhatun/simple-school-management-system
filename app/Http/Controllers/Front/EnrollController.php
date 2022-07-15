<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Enroll;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnrollController extends Controller
{
    protected static $enroll;

    public function enroll(Request $request)
    {
        if (Auth::check())
        {
           if (Auth::user()->access_label == 0)
           {
               Enroll::createEnroll($request);
               return back()->with('message', 'Course enrolled successfully');
           }
           else {
               return back()->with('error', 'Only student can enrolled');
           }
        }
        else {
            return redirect('/login')->with('error', 'You must login first');
        }
    }

    public function delete ($id)
    {
        self::$enroll = Enroll::find($id);
        self::$enroll->delete();
        return back()->with('message', 'Enroll deleted successfully');
    }
}
