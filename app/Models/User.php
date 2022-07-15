<?php

namespace App\Models;

use App\helper\Helper;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'access_label',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
    ];

    protected static $user;
    protected static $userDetails;

    public static function saveUserData ($request)
    {
       self::$user = User::create([
           'name' => $request->name,
           'email' => $request->email,
           'password' => bcrypt($request->password),
           'access_label' => $request->access_label,
        ]);

       UserDetail::UserDetail(self::$user);
    }


    public static function updateUserData($request, $id)
    {
        $user = User::find($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->access_label = $request->access_label;
        $user->save();
    }


    public static function updateProfile($request)
    {
        self::$user = User::updateOrCreate(['id' => Auth()->id()], [
           'name' => $request->name,
           'email' => $request->email,
        ]);
        self::$userDetails = UserDetail::where('user_id', Auth()->id())->first();
        self::$userDetails->phone      = $request->phone;
        self::$userDetails->nid      = $request->nid;
        self::$userDetails->address      = $request->address;
        self::$userDetails->image      = Helper::imageUpload($request->file('image'), 'profile-assets/img/');
        self::$userDetails->save();
    }


    public function userDetail()
    {
        return $this->hasOne(UserDetail::class);
    }
}
