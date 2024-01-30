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
            
            "patient_id"=>$this->resource->patient_id,
            
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
            "client_id"=>$this->resource->client_id,
            "client" =>$this->resource->client ?
                [
                    "id" =>$this->resource->client->id,
                    "first_name" =>$this->resource->client->first_name,
                    "last_name" =>$this->resource->client->last_name,
                    "full_name" =>$this->resource->client->first_name.' '.$this->resource->client->last_name,
                    "phone" =>$this->resource->client->phone,
                    "patient_id" =>$this->resource->client->patient_id,
                    "name_companion" =>$this->resource->client->person->name_companion,
                    "surname_companion" =>$this->resource->client->person->surname_companion,
                ]: NUll,
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
            
            //no borrar
            // "behavior"=>$this->resource->behavior,
            // "hypothesized_functions"=>$this->resource->hypothesized_functions,
            // "pairing"=>$this->resource->pairing,
            // "premack_principal"=>$this->resource->premack_principal,
            // "response_block"=>$this->resource->response_block,
            // "dro"=>$this->resource->dro,
            // "dra"=>$this->resource->dra,
            // "errorless_teaching"=>$this->resource->errorless_teaching,
            // "redirection"=>$this->resource->redirection,
            // "ncr"=>$this->resource->ncr,
            // "shaping"=>$this->resource->shaping,
            // "chaining"=>$this->resource->chaining,
            // 'files'=>$this->resource-> files->map(function($file){
            //     return [
            //         'id'=> $file->id,
            //         'bip_id'=> $file->bip_id,
            //         'name_file'=> $file->name_file,
            //         'size'=> $file->size,
            //         'file'=> env("APP_URL")."storage/".$file->file,
            //         'type'=> $file->type,
            //     ];
            // }),
            // "reduction"=>$this->resource->reduction ? [
            //     "id"=>$this->resource->reduction->id,
            //     "bip_id"=>$this->resource->reduction->bip_id,
            //     "goal"=>$this->resource->reduction->goal,
            //     "description"=>$this->resource->reduction->description,
            //     "status"=>$this->resource->reduction->status,
            //     "date"=>$this->resource->reduction->date ? Carbon::parse($this->resource->reduction->date)->format("Y/m/d") : NULL,
            // ]:NULL,
            // "maladaptive"=>$this->resource->maladaptive ? [
            //     "id"=>$this->resource->maladaptive->id,
            //     "client_id"=>$this->resource->maladaptive->client_id,
            //     "title"=>$this->resource->maladaptive->title,
            //     "bl_week"=>$this->resource->maladaptive->bl_week,
            //     "reduction_w"=>$this->resource->maladaptive->reduction_w,
            //     "s_date"=>$this->resource->maladaptive->s_date,
            //     "s_value"=>$this->resource->maladaptive->s_value,
            //     "m_date"=>$this->resource->maladaptive->m_date,
            //     "m_date"=>$this->resource->maladaptive->m_date,
            //     "t_date"=>$this->resource->maladaptive->t_date,
            //     "t_value"=>$this->resource->maladaptive->t_value,
            //     "w_date"=>$this->resource->maladaptive->w_date,
            //     "w_value"=>$this->resource->maladaptive->w_value,
            //     "th_date"=>$this->resource->maladaptive->th_date,
            //     "th_value"=>$this->resource->maladaptive->th_value,
            //     "f_date"=>$this->resource->maladaptive->f_date,
            //     "f_value"=>$this->resource->maladaptive->f_value,
            //     "st_date"=>$this->resource->maladaptive->st_date,
            //     "st_value"=>$this->resource->maladaptive->st_value,
            //     "totals"=>$this->resource->maladaptive->totals,
            // ]:NULL,
            
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,            

        ];
    }
}
