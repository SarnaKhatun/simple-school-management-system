@extends('front.master')
@section('title')
    Details
@endsection
@section('body')
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <img src="{{asset($course->image)}}" alt="" class="img-fluid w-100" style="height: 300px;">
                </div>
                <div class="col-md-6">
                    <div class="card card-body">
                        <h4 class="text-capitalize">title: {{$course->title}}</h4>
                        <p class="text-capitalize">course fee: {{$course->fee}}</p>
                        <p class="text-capitalize">starting date: {{$course->starting_date}}</p>
                        <p class="text-capitalize">short description: {{$course->short_description}}</p>
                        <form action="{{route('enroll.course')}}" method="post">
                            @csrf
                            <input type="hidden" name="course_id" value="{{$course->id}}">
                            <input type="submit" class="btn btn-primary" value="Enroll" {{$hasEnroll == true ? 'disabled' : ''}}>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                    <p class="text-capitalize">{!! \Illuminate\Support\Str::words($course->long_description, 3, '...') !!}</p>
                </div>
            </div>
        </div>
    </section>
@endsection
