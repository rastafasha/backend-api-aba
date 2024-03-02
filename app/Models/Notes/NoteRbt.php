<?php

namespace App\Models\Notes;

use App\Models\User;
use App\Models\Bip\Bip;
use App\Models\Patient\Patient;
use App\Models\Notes\Maladaptive;
use App\Models\Notes\Replacement;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class NoteRbt extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        'patient_id',
        'doctor_id',
        'bip_id',

        'provider_name_g',
        'provider_credential',
        'pos',
        'session_date',
        'time_in',
        'time_out',
        'time_in2',
        'time_out2',
        'session_length_total',
        'session_length_total2',
        'environmental_changes',
        
        'maladaptives',//json
        'replacements',//json
        'interventions',//json

        'meet_with_client_at',
        'client_appeared',
        'as_evidenced_by',
        'rbt_modeled_and_demonstrated_to_caregiver',
        'client_response_to_treatment_this_session',
        'progress_noted_this_session_compared_to_previous_session',
        'next_session_is_scheduled_for',
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

    // public function maladaptive()
    // {
    //     return $this->hasMany(Maladaptive::class);
    // }
    // public function replacement()
    // {
    //     return $this->hasMany(Replacement::class);
    // }
}
