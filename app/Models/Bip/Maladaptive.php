<?php

namespace App\Models\Bip;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Maladaptive extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable=[
        'patient_id',
        'title',
        'bl_week',
        'reduction_w',
        's_date',
        's_value',
        'm_date',
        'm_value',
        't_date',
        't_value',
        'w_date',
        'w_value',
        'th_date',
        'th_value',
        'f_date',
        'f_value',
        'st_date',
        'st_value',
        'totals',
    ];

}
