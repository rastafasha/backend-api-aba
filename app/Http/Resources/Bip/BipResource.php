<?php

namespace App\Http\Resources\Bip;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class BipResource extends JsonResource
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
            "type_of_assessment"=>$this->resource->type_of_assessment,
            
            // "patientID"=>$this->resource->patientID,
            
            "doctor_id" =>$this->resource->doctor_id,
            "doctor" =>$this->resource->doctor ? 
                [
                    "id" =>$this->resource->doctor->id,
                    "full_name" =>$this->resource->doctor->name.' '.$this->resource->doctor->surname,
                    // "avatar"=> $this->resource->doctor->avatar ? env("APP_URL")."storage/".$this->resource->doctor->avatar : null,
                    "avatar"=> $this->resource->doctor->avatar ? env("APP_URL").$this->resource->doctor->avatar : null,
                    // "speciality_id" => $this->resource->doctor->speciality_id,
                    //         "speciality"=>$this->resource->doctor->speciality ? [
                    //             "id"=> $this->resource->doctor->speciality->id,
                    //             "name"=> $this->resource->doctor->speciality->name,
                    //             "price"=> $this->resource->doctor->speciality->price,
                    //         ]:NULL,
                ]: NULL,
            "patient_id"=>$this->resource->patient_id,
            "background_information"=>$this->resource->background_information,
            "previus_treatment_and_result"=>$this->resource->previus_treatment_and_result,
            "current_treatment_and_progress"=>$this->resource->current_treatment_and_progress,
            "education_status"=>$this->resource->education_status,
            "phisical_and_medical_status"=>$this->resource->phisical_and_medical_status,
            "assestment_conducted"=>$this->resource->assestment_conducted,
            
            'documents_reviewed'=> json_decode($this->resource-> documents_reviewed),
            'maladaptives'=> json_decode($this->resource-> maladaptives),
            "assestment_conducted_options"=>json_decode($this->resource-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($this->resource-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($this->resource-> interventions),
            "goal_stos"=>json_decode($this->resource->goal_stos),
            "goal_ltos"=>json_decode($this->resource->goal_ltos),
            
            


            "reduction_goal"=>$this->resource->reduction_goals ,
            "sustitution_goal"=>$this->resource->sustitution_goals , 
                
            "family_envolment"=>$this->resource->family_envolments ,
            "monitoring_evalutating"=>$this->resource->monitoring_evalutatings ,
            "generalization_training"=>$this->resource->generalization_trainings ,
            "crisis_plan"=>$this->resource->crisis_plans ,
            "de_escalation_technique"=>$this->resource->de_escalation_techniques ,
            "consent_to_treatment"=>$this->resource->consent_to_treatments,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d") : NULL,            

        ];
    }
}
