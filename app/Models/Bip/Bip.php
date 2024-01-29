<?php

namespace App\Models\Bip;
use App\Models\Bip\Reduction;
use App\Models\Bip\Maladaptive;
use App\Models\Patient\Patient;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Bip extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        'documents_reviewed',
        'client_id',
        'type_of_assessment',
        'background_information',
        'previus_treatment_and_result',
        'current_treatment_and_progress',
        'education_status',
        'phisical_and_medical_status',
        'assestment_conducted',
        'assestment_conducted_options',
        'prevalent_setting_event_and_atecedents',
        'behavior',
        'hypothesized_functions',
        'pairing',
        'premack_principal',
        'response_block',
        'dro',
        'dra',
        'errorless_teaching',
        'redirection',
        'ncr',
        'shaping',
        'chaining',
        'maladaptive_id',
        'reduction_id',
    ];


     public function patient()
    {
        return $this->hasOne(Patient::class, 'client_id');
    }
     public function maladaptive()
    {
        return $this->hasOne(Maladaptive::class, 'maladaptive_id');
    }
     public function reduction()
    {
        return $this->hasOne(Reduction::class, 'reduction_id');
    }

    public function bip_files(){
        return $this->hasMany(BipFile::class, "documents_reviewed");
    }
}
