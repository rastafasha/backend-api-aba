<?php

namespace App\Models\Patient;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Location;
use App\Models\Bip\ReductionGoal;
use App\Models\Insurance\Insurance;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Patient extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        'first_name',
        'last_name',
        'email',
        'phone',
        'patient_id', // en este caso el es ingresado manualmente ... // para la relacion con el id es client_id
        'birth_date',
        'gender',
        'address',
        'language',
        'relationship',
        'parent_guardian_name',
        'home_phone',
        'home_phone',
        'work_phone',
        'school_name',
        'school_number',
        'age',
        'education',
        'profession',
        'zip',
        'state',
        'avatar',
        'special_note',
        'city',
        'diagnosis_code',
        'patient_control',
        'schedule',
        'summer_schedule',

        //benefits
        'insurer_id',

        'insuranceId',
        'insurer_secundary',
        'insuranceId_secundary',
        'elegibility_date',
        'pos_covered',
        'deductible_individual_I_F',
        'balance',
        'coinsurance',
        'copayments',
        'oop',
        'insurer_file',
        'intake_file',

        //intake
        'welcome',
        'consent',
        'insurance_card',
        'eligibility',
        'mnl',
        'referral',
        'ados',
        'iep',
        'asd_diagnosis',
        'cde',
        'submitted',
        
        //pas
        'pa_assessments',
        
        
        //specialits
        'rbt_id',
        'rbt2_id',
        'bcba_id',
        'bcba2_id',
        'clin_director_id',
        
        'location_id',
        'status',

        //??
        // 'current_auth_expires',
        // 'telehealth',
        // 'insurer',
        // 'compayment_per_visit',
        // 'need_cognitive_eval',
        // 'rst_wk_hr',
        // 'rst',
        // 'an_wk_s',
        // 'pt',
        // 'school_bcba',
        // 'analyst_bcba',
        // 'data_report_and_rbt_correction',

        
    ];


    const waiting = 'waiting';
    const requested = 'requested';
    const reviewing = 'reviewing';
    const need_new = 'need new';
    const insurance = '2 insurance';
    const psycho_eval = 'psycho eval';
    const yes = 'yes';
    const no = 'no';
    
    public static function welcomeTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function consentTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function insurance_cardTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function mnlTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function referralTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function adosTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function iepTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function asd_diagnosisTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function cdeTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }
    public static function submittedTypes()
    {
        return [
            self::waiting, self::requested, 
            self::reviewing, self::requested, 
            self::need_new, self::psycho_eval,
            self::insurance, self::no, self::yes,
        ];
    }



    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }

    


    public function rbts()
        {
            return $this->hasMany(User::class);
        }
    public function rbt2s()
        {
            return $this->hasMany(User::class);
        }
    public function bcbas()
        {
            return $this->hasMany(User::class);
        }
    public function bcba2s()
        {
            return $this->hasMany(User::class);
        }
    public function clin_directors()
        {
            return $this->hasMany(User::class);
        }

    public function insurances()
    {
        return $this->hasMany(Insurance::class);
    }
    public function bip()
    {
        return $this->hasOne(Bip::class, 'patient_id');
        // se relaciona con el patient_id, para que en algun caso se ingrese de nuevo, se verifique si ya existe
    }
    public function reductiongoal()
    {
        return $this->hasMany(ReductionGoal::class, 'patient_id');
    }

    public function locations()
    {
        return $this->hasMany(Location::class);
    }


    //filtro buscador
    public function scopefilterAdvancePatient($query,
    $patient_id, $name_patient, $email_patient,
    ){
        
        if($patient_id){
            $query->where("patient_id", $patient_id);
        }

        if($name_patient){
            $query->whereHas("patient", function($q)use($name_patient){
                $q->where(DB::raw("CONCAT(patients.first_name,' ',IFNULL(patients.last_name,''),' ',IFNULL(patients.email,''))"),"like","%".$name_patient."%");
                   
            });
        }
        

        // if($date_start && $date_end){
        //     $query->whereBetween("date_appointment", [
        //         Carbon::parse($date_start)->format("Y-m-d"),
        //         Carbon::parse($date_end)->format("Y-m-d"),
        //     ]);
        // }
        return $query;
    }
}
