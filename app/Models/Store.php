<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User;

class Store extends User implements MustVerifyEmail
{
    use HasFactory;

    protected $connection = 'mysql';

    protected $table = 'stores';

    protected $primaryKey = 'id';

    protected $keyType = 'int';

    public $incrementing = true;

    public $timestamps = true;

    const CREATED_AT = 'created_at';

    const UPDATED_AT = 'updated_at';

    protected $fillable = [
        'name', 'slug',
    ];

    public function products()
    {
        return $this->hasMany(Product::class, 'store_id', 'id');
    }
}