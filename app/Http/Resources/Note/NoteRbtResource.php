<?php

namespace App\Http\Resources\Note;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class NoteRbtResource extends JsonResource
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
            "session_date" => Carbon::parse($this->resource->session_date)->format('d-m-Y'),
            "next_session_is_scheduled_for" => Carbon::parse($this->resource->next_session_is_scheduled_for)->format('d-m-Y'),
            
            "interventions"=>json_decode($this->resource-> interventions),
            "replacement"=>json_decode($this->resource-> replacement),
            "maladaptive"=>json_decode($this->resource-> maladaptive),
            
            "bip_id" => $this->resource->bip_id,
            "patient_id" => $this->resource->patient_id,
            // "patient"=>$this->resource->patient_id ? 
            //         [
            //             "id"=> $this->resource->patient->id,
            //             "email" =>$this->resource->patient->email,
            //             "full_name" =>$this->resource->patient->name.' '.$this->resource->patient->surname,
            //         ]: NULL,
            
            
            "doctor_id" => $this->resource->doctor_id,
            // "doctor"=>$this->resource->doctor ? 
            //             [
            //                 "id"=> $doctor->id,
            //                 "email"=> $doctor->email,
            //                 "full_name" =>$doctor->name.' '.$doctor->surname,
            //             ]: NULL,


            "meet_with_client_at" =>$this->resource->meet_with_client_at,

            "time_in" =>$this->resource->time_in,
            "time_out" =>$this->resource->time_out,
            "time_in2" =>$this->resource->time_in2,
            "time_out2" =>$this->resource->time_out2,
            "session_length_total" =>($this->resource->time_out - $this->resource->time_in)/ 100,
            "session_length_total2" =>($this->resource->time_out2 - $this->resource->time_in2) /100,

            "client_appeared" =>$this->resource->client_appeared,
            "as_evidenced_by" =>$this->resource->as_evidenced_by,
            "rbt_modeled_and_demonstrated_to_caregiver" =>$this->resource->rbt_modeled_and_demonstrated_to_caregiver,
            "client_response_to_treatment_this_session" =>$this->resource->client_response_to_treatment_this_session,
            "progress_noted_this_session_compared_to_previous_session" =>$this->resource->progress_noted_this_session_compared_to_previous_session,
            "next_session_is_scheduled_for" =>$this->resource->next_session_is_scheduled_for,
            // "provider_signature"=> $this->resource->provider_signature ? env("APP_URL")."storage/".$this->resource->provider_signature : null,
            "provider_signature"=> $this->resource->provider_signature ? env("APP_URL").$this->resource->provider_signature : null,
            "provider_name" =>$this->resource->provider_name,
            // "supervisor_signature"=> $this->resource->supervisor_signature ? env("APP_URL")."storage/".$this->resource->supervisor_signature : null,
            "supervisor_signature"=> $this->resource->supervisor_signature ? env("APP_URL").$this->resource->supervisor_signature : null,
            "supervisor_name" =>$this->resource->supervisor_name,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
            "updated_at"=>$this->resource->updated_at ? Carbon::parse($this->resource->updated_at)->format("Y-m-d h:i A") : NULL,
            
        ];
    }
}
