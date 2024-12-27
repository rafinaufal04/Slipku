<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $guarded = ['id'];

    public function position()
    {
        return $this->belongsTo(Position::class);
    }

    public function wages()
    {
        return $this->hasMany(Wage::class);
    }
}
