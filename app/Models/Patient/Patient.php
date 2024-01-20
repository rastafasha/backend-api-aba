<?php

namespace App\Models\Patient;

use Carbon\Carbon;
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
        'n_doc',
        'birth_date',
        'gender',
        'address',
        'avatar',
        'diagnosis_code',
        'telehealth',
        'insurer',
        'eligibility',
        'compayment_per_visit',
        'patient_control',
        'pa_assessment',
        'pat_id',
        'pa_services',
        'ba_services_start_date',
        'current_auth_expires',
        'need_cognitive_eval',
        'city',
        'schedule',
        'rst_wk_hr',
        'rst',
        'an_wk_s',
        'pt',
        'school_bcba',
        'analyst_bcba',
        'data_report_and_rbt_correction',
        'parent_comunication',
        'notes',
        'welcome',
        'consent',
        'insurance_card',
        'mnl',
        'referral',
        'ados',
        'iep',
        'asd_diagnosis',
        'cde',
        'submitted',
        
    ];


    const pending = 'pending';
    const resquested = 'resquested';
    const need_ne = 'need ne';
    const yes = 'yes';
    const no = 'no';

    public static function welcomeTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function consentTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function insurance_cardTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function mnlTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function referralTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function adosTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function iepTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function asd_diagnosisTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function cdeTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
        ];
    }
    public static function submittedTypes()
    {
        return [
            self::resquested, self::pending,
            self::need_ne, self::yes,
            self::no,
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

    //  public function person()
    // {
    //     return $this->hasOne(PatientPerson::class, 'patient_id');
    // }
}
