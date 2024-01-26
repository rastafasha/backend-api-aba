<?php

namespace App\Http\Resources\Patient;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class PatientResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "id"=>$this->resource->id,
            "pat_id"=>$this->resource->pat_id,
            "first_name"=>$this->resource->first_name,
            "last_name"=>$this->resource->last_name,
            "full_name"=> $this->resource->first_name.' '.$this->resource->last_name,
            "email"=>$this->resource->email,
            "phone"=>$this->resource->phone,
            "avatar"=> $this->resource->avatar ? env("APP_URL")."storage/".$this->resource->avatar : null,
            "birth_date"=>$this->resource->birth_date ? Carbon::parse($this->resource->birth_date)->format("Y/m/d") : NULL,
            "gender"=>$this->resource->gender,
            "address"=>$this->resource->address,
            "language"=>$this->resource->language,
            "home_phone"=>$this->resource->home_phone,
            "work_phone"=>$this->resource->work_phone,
            "zip"=>$this->resource->zip,
            "city"=>$this->resource->city,
            "relationship"=>$this->resource->relationship,
            "profession"=>$this->resource->profession,
            "education"=>$this->resource->education,
            "state"=>$this->resource->state,
            "school_name"=>$this->resource->school_name,
            "school_number"=>$this->resource->school_number,
            "age"=>$this->resource->age,
            "parent_guardian_name"=>$this->resource->parent_guardian_name,
            "schedule"=>$this->resource->schedule,
            "summer_schedule"=>$this->resource->summer_schedule,
            "diagnosis_code"=>$this->resource->diagnosis_code,
            "special_note"=>$this->resource->special_note,
            "patient_control"=>$this->resource->patient_control,
            
            //benefits
            "insurer"=>$this->resource->insurer,
            "insuranceId"=>$this->resource->insuranceId,
            "insurer_secundary"=>$this->resource->insurer_secundary,          
            "insuranceId_secundary"=>$this->resource->insuranceId_secundary,          
            "elegibility_date"=>$this->resource->elegibility_date ? Carbon::parse($this->resource->elegibility_date)->format("Y/m/d") : NULL,
            "pos_covered"=>$this->resource->pos_covered,
            "deductible_individual_I_F"=>$this->resource->deductible_individual_I_F,
            "balance"=>$this->resource->balance,
            "coinsurance"=>$this->resource->coinsurance,
            "copayments"=>$this->resource->copayments,
            "oop"=>$this->resource->oop,
            "insurer_file"=> $this->resource->insurer_file ? env("APP_URL")."storage/".$this->resource->insurer_file : null,
            "intake_file"=> $this->resource->intake_file ? env("APP_URL")."storage/".$this->resource->intake_file : null,

            //intake
            "welcome"=>$this->resource->welcome,
            "consent"=>$this->resource->consent,
            "insurance_card"=>$this->resource->insurance_card,
            "eligibility"=>$this->resource->eligibility,
            "mnl"=>$this->resource->mnl,
            "referral"=>$this->resource->referral,
            "ados"=>$this->resource->ados,
            "iep"=>$this->resource->iep,
            "asd_diagnosis"=>$this->resource->asd_diagnosis,
            "cde"=>$this->resource->cde,
            "submitted"=>$this->resource->submitted,
            
            //pas
            "pa_assessment"=>$this->resource->pa_assessment,
            "pa_assessment_start_date"=>$this->resource->pa_assessment_start_date ? Carbon::parse($this->resource->pa_assessment_start_date)->format("Y/m/d") : NULL,
            "pa_assessment_end_date"=>$this->resource->pa_assessment_end_date ? Carbon::parse($this->resource->pa_assessment_end_date)->format("Y/m/d") : NULL,
            // "pa_services"=>$this->resource->pa_services,
            'pa_services'=> json_decode($this->resource-> pa_services),
            "pa_services_start_date"=>$this->resource->pa_services_start_date ? Carbon::parse($this->resource->pa_services_start_date)->format("Y/m/d") : NULL,
            "pa_services_end_date"=>$this->resource->pa_services_end_date ? Carbon::parse($this->resource->pa_services_end_date)->format("Y/m/d") : NULL,
            
            //??
            // "telehealth"=>$this->resource->telehealth,
            // "insurer"=>$this->resource->insurer,
            // "compayment_per_visit"=>$this->resource->compayment_per_visit,
            // "current_auth_expires"=>$this->resource->current_auth_expires ? Carbon::parse($this->resource->current_auth_expires)->format("Y/m/d") : NULL,
            // "need_cognitive_eval"=>$this->resource->need_cognitive_eval,
            // "rst_wk_hr"=>$this->resource->rst_wk_hr,
            // "rst"=>$this->resource->rst,
            // "an_wk_s"=>$this->resource->an_wk_s,
            // "pt"=>$this->resource->pt,
            // "school_bcba"=>$this->resource->school_bcba,
            // "analyst_bcba"=>$this->resource->analyst_bcba,
            // "data_report_and_rbt_correction"=>$this->resource->data_report_and_rbt_correction,
            

            "specialist_id" => $this->resource->speciality_id,
            "specialist"=>$this->resource->specialist ? [
                "id"=> $this->resource->specialist->id,
                "name"=> $this->resource->specialist->name,
            ]:NULL,
            "insurer_id" => $this->resource->insurer_id,
            "insurer"=>$this->resource->insurer ? [
                "id"=> $this->resource->insurer->id,
                "name"=> $this->resource->insurer->name,
            ]:NULL,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
            

        ];
    }
}
