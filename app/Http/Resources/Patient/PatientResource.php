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
            "patient_id"=>$this->resource->patient_id,// en este caso el patient_id es ingresado manualmente ... // para la relacion con el id es client_id
            "first_name"=>$this->resource->first_name,
            "last_name"=>$this->resource->last_name,
            "full_name"=> $this->resource->first_name.' '.$this->resource->last_name,
            "email"=>$this->resource->email,
            "phone"=>$this->resource->phone,
            "avatar"=> $this->resource->avatar ? env("APP_URL")."storage/".$this->resource->avatar : null,
            // "avatar"=> $this->resource->avatar ? env("APP_URL").$this->resource->avatar : null,
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
            "insurer_id"=>$this->resource->insurer_id,
            // "insurance"=>$this->resource->insurances ? [
            //     "id"=> $this->resource->insurance->id,
            //     "insurer_name" =>$this->resource->insurer_name,
            //     'notes'=> json_decode($this->resource->insurance-> notes)? : null,
            //     'services'=> json_decode($this->resource->insurance-> services)? : null,
            // ]:NULL,

            "status"=>$this->resource->status,
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
            // "insurer_file"=> $this->resource->insurer_file ? env("APP_URL")."storage/".$this->resource->insurer_file : null,
            // "intake_file"=> $this->resource->intake_file ? env("APP_URL")."storage/".$this->resource->intake_file : null,

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
            "pa_assessments"=>json_decode($this->resource->pa_assessments) ? : null,

            "location_id" =>$this->resource->location_id,
            // "location_id" =>implode($this->resource->location_id),

            // "location"=> $this->resource->locations ?[
            //     "id" =>$this->resource->location->id,
            //     "title"=>$this->resource->location->title,
            //     "address"=>$this->resource->location->address,
            //     "phone1"=>$this->resource->phone1,
            //     "phone2"=>$this->resource->location->phone2,
            //     "email"=>$this->resource->location->email,
            //     "city"=>$this->resource->location->city,
            //     "state"=>$this->resource->location->state,
            //     "zip"=>$this->resource->location->zip,
            // ]:null,

            "rbt_id" =>$this->resource->rbt_id,
            // "rbt_id" =>$this->resource->rbt_id ? 
            // [
            //     "id" =>$this->resource->rbt_id,
            //     "full_name" =>$this->resource->rbt_id->name.' '.$this->resource->rbt_id->surname,
            //     // "avatar"=> $this->resource->rbt_id->avatar ? env("APP_URL")."storage/".$this->resource->rbt_id->avatar : null,
            //     "avatar"=> $this->resource->rbt_id->avatar ? env("APP_URL").$this->resource->rbt_id->avatar : null,
                
            // ]: NULL,
            "rbt2"=>$this->resource->rbt2_id,
            // "rbt2" =>$this->resource->rbt2s ? 
            //     [
            //         "id" =>$this->resource->rbt2->id,
            //         "full_name" =>$this->resource->rbt2->name.' '.$this->resource->rbt2->surname,
            //         // "avatar"=> $this->resource->rbt2->avatar ? env("APP_URL")."storage/".$this->resource->rbt2->avatar : null,
            //         "avatar"=> $this->resource->rbt2->avatar ? env("APP_URL").$this->resource->rbt2->avatar : null,
                    
            //     ]: NULL,
            "bcba"=>$this->resource->bcba_id,
            // "bcba" =>$this->resource->bcbas ? 
            //     [
            //         "id" =>$this->resource->bcba->id,
            //         "full_name" =>$this->resource->bcba->name.' '.$this->resource->bcba->surname,
            //         // "avatar"=> $this->resource->bcba->avatar ? env("APP_URL")."storage/".$this->resource->bcba->avatar : null,
            //         "avatar"=> $this->resource->bcba->avatar ? env("APP_URL").$this->resource->bcba->avatar : null,
                    
            //     ]: NULL,
            "bcba2"=>$this->resource->bcba2_id,
            // "bcba2" =>$this->resource->bcba2s ? 
            //     [
            //         "id" =>$this->resource->bcba2->id,
            //         "full_name" =>$this->resource->bcba2->name.' '.$this->resource->bcba2->surname,
            //         // "avatar"=> $this->resource->bcba2->avatar ? env("APP_URL")."storage/".$this->resource->bcba2->avatar : null,
            //         "avatar"=> $this->resource->bcba2->avatar ? env("APP_URL").$this->resource->bcba2->avatar : null,
                    
            //     ]: NULL,
            "clin_director_id"=>$this->resource->clin_director_id,
            // "clin_director" =>$this->resource->clin_directors ? 
            //     [
            //         "id" =>$this->resource->clin_director->id,
            //         "full_name" =>$this->resource->clin_director->name.' '.$this->resource->clin_director->surname,
                    
            //     ]: NULL,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
            


        ];
    }

}
