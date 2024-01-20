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
            "first_name"=>$this->resource->first_name,
            "last_name"=>$this->resource->last_name,
            "full_name"=> $this->resource->first_name.' '.$this->resource->last_name,
            "email"=>$this->resource->email,
            "n_doc"=>$this->resource->n_doc,
            "phone"=>$this->resource->phone,
            "avatar"=> $this->resource->avatar ? env("APP_URL")."storage/".$this->resource->avatar : null,
            "birth_date"=>$this->resource->birth_date ? Carbon::parse($this->resource->birth_date)->format("Y/m/d") : NULL,
            "gender"=>$this->resource->gender,
            "address"=>$this->resource->address,
            "diagnosis_code"=>$this->resource->diagnosis_code,
            "telehealth"=>$this->resource->telehealth,
            "insurer"=>$this->resource->insurer,
            "eligibility"=>$this->resource->eligibility,
            "compayment_per_visit"=>$this->resource->compayment_per_visit,
            "patient_control"=>$this->resource->patient_control,
            "pa_assessment"=>$this->resource->pa_assessment,
            "pat_id"=>$this->resource->pat_id,
            "pa_services"=>$this->resource->pa_services,
            "ba_services_start_date"=>$this->resource->ba_services_start_date ? Carbon::parse($this->resource->ba_services_start_date)->format("Y/m/d") : NULL,
            "current_auth_expires"=>$this->resource->current_auth_expires ? Carbon::parse($this->resource->current_auth_expires)->format("Y/m/d") : NULL,
            "need_cognitive_eval"=>$this->resource->need_cognitive_eval,
            "city"=>$this->resource->city,
            "schedule"=>$this->resource->schedule,
            "rst_wk_hr"=>$this->resource->rst_wk_hr,
            "rst"=>$this->resource->rst,
            "an_wk_s"=>$this->resource->an_wk_s,
            "pt"=>$this->resource->pt,
            "school_bcba"=>$this->resource->school_bcba,
            "analyst_bcba"=>$this->resource->analyst_bcba,
            "data_report_and_rbt_correction"=>$this->resource->data_report_and_rbt_correction,
            "parent_comunication"=>$this->resource->parent_comunication,
            "notes"=>$this->resource->notes,
            "welcome"=>$this->resource->welcome,
            "consent"=>$this->resource->consent,
            "insurance_card"=>$this->resource->insurance_card,
            "mnl"=>$this->resource->mnl,
            "referral"=>$this->resource->referral,
            "ados"=>$this->resource->ados,
            "iep"=>$this->resource->iep,
            "asd_diagnosis"=>$this->resource->asd_diagnosis,
            "cde"=>$this->resource->cde,
            "submitted"=>$this->resource->submitted,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
            

        ];
    }
}
