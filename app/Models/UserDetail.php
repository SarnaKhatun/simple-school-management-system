<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'phone',
        'address',
        'image',
        'nid',
        'status',
    ];

    public static function UserDetail ($user, $id = null)
    {
        UserDetail::updateOrCreate(['user_id' => $id], [
            'user_id' => $user->id,
        ]);
    }
}
