<?php

namespace App\Models\Bip;
use App\Models\Bip\Maladaptive;
use App\Models\Patient\Patient;
use App\Models\Bip\ReductionGoal;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Bip extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        'type_of_assessment',
        'documents_reviewed',
        'client_id',
        'doctor_id',
        'patientID',
        'background_information',
        'previus_treatment_and_result',
        'current_treatment_and_progress',
        'education_status',
        'phisical_and_medical_status',
        'maladaptives',//json
        'assestment_conducted',
        'assestment_conducted_options',//json
        'prevalent_setting_event_and_atecedents',//json
        'interventions',//json
        'reduction_id',

        //no borrar
        // 'behavior',
        // 'hypothesized_functions',
        // 'premack_principal',
        // 'response_block',
        // 'dro',
        // 'dra',
        // 'errorless_teaching',
        // 'redirection',
        // 'ncr',
        // 'shaping',
        // 'chaining',
        // 'maladaptive_id',
    ];


     public function client()
    {
        return $this->hasOne(Patient::class, 'client_id');
    }

    public function doctor() {
        return $this->belongsTo(User::class,"doctor_id");
    }

    //  public function doctors()
    // {
    //     return $this->hasMany(User::class, 'doctor_id');
    // }
    //  public function maladaptive()
    // {
    //     return $this->hasOne(Maladaptive::class, 'maladaptive_id');
    // }
     public function reduction_goals()
    {
        return $this->hasMany(ReductionGoal::class,'reduction_id');
    }

    // public function bip_files(){
    //     return $this->hasMany(BipFile::class, "documents_reviewed");
    // }

    // filtro buscador

    public function scopefilterAdvanceBip($query,
    $patientID, 
    $name_doctor, 
    $date){
        
        if($patientID){
            $query->where("patientID", $patientID);
        }

        if($name_doctor){
            $query->whereHas("doctor", function($q)use($name_doctor){
                $q->where("name", "like","%".$name_doctor."%")
                    ->orWhere("surname", "like","%".$name_doctor."%");
            });
        }

        if($date){
            $query->whereDate("date_appointment", Carbon::parse($date)->format("Y-m-d"));
        }
        return $query;
    }
}
