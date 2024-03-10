<?php

namespace App\Http\Resources\Note;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class NoteBcbaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return[
            'id'=>$this->resource-> id,
            "bip_id" => $this->resource->bip_id,
            "patient_id" => $this->resource->patient_id,
            "doctor_id" => $this->resource->doctor_id,
            "note_description" => $this->resource->note_description,
            
            "caregiver_goals"=>json_decode($this->resource-> caregiver_goals) ? : null,
            "rbt_training_goals"=>json_decode($this->resource-> rbt_training_goals) ? : null,
            "location" => $this->resource->location,
            
            "rendering_provider" => $this->resource->rendering_provider,
            // "birth_date" => $this->resource->birth_date,
            "birth_date"=>$this->resource->birth_date ? Carbon::parse($this->resource->birth_date)->format("Y-m-d") : NULL,
            "aba_supervisor" => $this->resource->aba_supervisor,
            "cpt_code" =>$this->resource->cpt_code,
            "diagnosis_code" =>$this->resource->diagnosis_code,

            
            "provider_signature"=> $this->resource->provider_signature ? env("APP_URL")."storage/".$this->resource->provider_signature : null,
            // "provider_signature"=> $this->resource->provider_signature ? env("APP_URL").$this->resource->provider_signature : null,
            "provider_name" =>$this->resource->provider_name,
            
            "supervisor_signature"=> $this->resource->supervisor_signature ? env("APP_URL")."storage/".$this->resource->supervisor_signature : null,
            // "supervisor_signature"=> $this->resource->supervisor_signature ? env("APP_URL").$this->resource->supervisor_signature : null,
            "supervisor_name" =>$this->resource->supervisor_name,
            
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
            "updated_at"=>$this->resource->updated_at ? Carbon::parse($this->resource->updated_at)->format("Y-m-d h:i A") : NULL,
            
        ];
    }
}
