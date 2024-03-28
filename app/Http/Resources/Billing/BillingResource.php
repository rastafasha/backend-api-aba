<?php

namespace App\Http\Resources\Billing;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class BillingResource extends JsonResource
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
            // traemos al paciente 
            'patient_id'=>$this->resource->patient_id,
            // "patient" =>$this->resource->patient ? 
            //     [
            //         "patient_id" =>$this->resource->patient->patient_id,
            //         // traemos al seguro
            //         'insurer_id'=>$this->resource->patient->insurer_id,
            //         "insurance" =>$this->resource->insurance ? 
            //             [
            //                 "id" =>$this->resource->insurance->id,
            //                 "insurer_name" =>$this->resource->insurance->insurer_name,
            //                 //codigo de la unidad
            //                 'cpt_code'=> json_decode($this->resource-> services) ? : null,//trae el json convertido para manipular
            //                 // valor de la unidad
            //                 'insurer_rate'=>json_decode($this->resource-> services) ? : null,
                            
            //                 'services'=> json_decode($this->resource-> services) ? : null,//trae el json convertido para manipular
                            
            //             ]: NULL,
            //         // traemos al codigo del seguro desde el paciente
            //         "cpt_code" =>$this->resource->patient->cpt_code,
            //         "full_name" =>$this->resource->patient->name.' '.$this->resource->patient->surname,
            //         // "avatar"=> $this->resource->doctor->avatar ? env("APP_URL")."storage/".$this->resource->doctor->avatar : null,
            //         "avatar"=> $this->resource->doctor->avatar ? env("APP_URL").$this->resource->doctor->avatar : null,
                    
            //     ]: NULL,
            // 'cpt_code'=>$this->resource->cpt_code,
            
              // traemos al especialista 
            'sponsor_id'=>$this->resource->sponsor_id,
            // "sponsor" =>$this->resource->sponsor ? 
            //     [
            //         "id" =>$this->resource->sponsor->id,
            //         "full_name" =>$this->resource->sponsor->name.' '.$this->resource->sponsor->surname,
            //         // "avatar"=> $this->resource->doctor->avatar ? env("APP_URL")."storage/".$this->resource->doctor->avatar : null,
            //         "avatar"=> $this->resource->sponsor->avatar ? env("APP_URL").$this->resource->doctor->avatar : null,
                    
            //     ]: NULL,

            // traemos al seguro      
              
            // 'insurer_id'=>$this->resource->insurer_id,
            // "insurance" =>$this->resource->insurance ? 
            //     [
            //         "id" =>$this->resource->insurance->id,
            //         "insurer_name" =>$this->resource->insurance->insurer_name,
                    
            //     ]: NULL,

            

            //viene de la session_date de la notarbt
            'date'=>$this->resource->date,
            
             //sacamos el total de las horas trabajadas de la nota rbt por nota  
            'total_hours'=>$this->resource->total_hours,

            //totales de unidades
            'total_units'=>$this->resource->total_units, 
            
            'billing_total'=>$this->resource->billing_total,
            'week_total_hours'=>$this->resource->week_total_hours,
            'week_total_units'=>$this->resource->week_total_units ,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,            

        ];
    }
}
