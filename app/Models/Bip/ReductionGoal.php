<?php

namespace App\Models\Bip;

use App\Models\Bip\Bip;
use App\Models\Patient\Patient;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ReductionGoal extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable =[
        'bip_id',
        'sto',
        'goal',
        'goal_id',
        'patient_id',
        'decription_goal',
        'status',
        'date',
        'lto',
        'description_lto',
        'status_lto',
        'date_lto',

    ];

    public function bips()
    {
        return $this->hasMany(Bip::class, 'bip_id');
    }
    public function patient()
    {
        return $this->hasMany(Patient::class,'patient_id');
    }
}
