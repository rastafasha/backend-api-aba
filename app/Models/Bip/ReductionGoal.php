<?php

namespace App\Models\Bip;

use App\Models\Bip\Bip;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ReductionGoal extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable =[
        'bip_id',
        'goal',
        'description',
        'status',
        'date',

    ];

    public function bips()
    {
        return $this->hasMany(Bip::class, 'bip_id');
    }
}
