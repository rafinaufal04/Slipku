<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wage extends Model
{
    protected $guarded = ['id'];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }
}
