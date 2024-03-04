<?php

namespace App\Models\Notes;

use App\Models\User;
use App\Models\Bip\Bip;
use App\Models\Patient\Patient;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class NoteBcba extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        'patient_id',
        'doctor_id',
        'bip_id',
        'location',
        'rendering_provider',

        'diagnosis_code',
        'birth_date',
        'aba_supervisor',
        'note_description',
        'cpt_code',
        
        'caregiver_goals',//json
        'rbt_training_goals',//json

        'provider_signature',
        'provider_name',
        'supervisor_signature',
        'supervisor_name',

    ];

    public function patient()
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }

    public function doctor() {
        return $this->hasMany(User::class,"doctor_id");
    }

    public function bips()
    {
        return $this->belongsTo(Bip::class, 'bip_id');
    }
}
