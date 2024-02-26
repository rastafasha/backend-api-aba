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
            "maladaptive"=>$noteRbt->maladaptive ? 
                    [
                        "id"=> $noteRbt->maladaptive->id,
                        'patient_id' => $patient->id,
                        'doctor_id' => $doctor->id,
                        "note_rbt_id" => $request-> note_rbt_id,
                        "maladaptive" => $request-> maladaptive,
                        "number_of_occurrences" => $request-> number_of_occurrences,
                    ]: NULL,
            // "replacement" =>$request->replacement,
            "replacement"=>$noteRbt->replacement ? 
                    [
                        "id"=> $noteRbt->replacement->id,
                        'patient_id' => $patient->id,
                        'doctor_id' => $doctor->id,
                        "note_rbt_id" => $request-> note_rbt_id,
                        "replacement" => $request-> replacement,
                        "total_trials" => $request-> total_trials,
                        "number_of_correct_response" => $request-> number_of_correct_response,
                    ]: NULL,
            
            "session_date" => Carbon::parse($noteRbt->session_date)->format('d-m-Y'),
            "next_session_is_scheduled_for" => Carbon::parse($noteRbt->next_session_is_scheduled_for)->format('d-m-Y'),
            
            "interventions"=>json_decode($noteRbt-> interventions),
            
            "patient"=>$noteRbt->patient_id ? 
                    [
                        "id"=> $noteRbt->patient->id,
                        "email" =>$noteRbt->patient->email,
                        "full_name" =>$noteRbt->patient->name.' '.$noteRbt->patient->surname,
                    ]: NULL,
            
            "doctor_id" => $noteRbt->doctor_id,
            "doctor"=>$noteRbt->doctor_id ? 
                        [
                            "id"=> $doctor->id,
                            "email"=> $doctor->email,
                            "full_name" =>$doctor->name.' '.$doctor->surname,
                        ]: NULL,

            "meet_with_client_at" =>$request->meet_with_client_at,
            "client_appeared" =>$request->client_appeared,
            "as_evidenced_by" =>$request->as_evidenced_by,
            "rbt_modeled_and_demonstrated_to_caregiver" =>$request->rbt_modeled_and_demonstrated_to_caregiver,
            "client_response_to_treatment_this_session" =>$request->client_response_to_treatment_this_session,
            "progress_noted_this_session_compared_to_previous_session" =>$request->progress_noted_this_session_compared_to_previous_session,
            "next_session_is_scheduled_for" =>$request->next_session_is_scheduled_for,
            "provider_signature" =>$request->provider_signature,
            "provider_name" =>$request->provider_name,
            "supervisor_signature" =>$request->supervisor_signature,
            "supervisor_name" =>$request->supervisor_name,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
            "updated_at"=>$this->resource->updated_at ? Carbon::parse($this->resource->updated_at)->format("Y-m-d h:i A") : NULL,
            
        ];
    }
}
