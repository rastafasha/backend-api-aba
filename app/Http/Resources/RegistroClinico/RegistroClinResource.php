<?php

namespace App\Http\Resources\RegistroClinico;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class RegistroClinResource extends JsonResource
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
            "date"=>$this->resource->$this->resource->date ? Carbon::parse($this->resource->date)->format("Y/m/d") : NULL,
            "start_in"=>$this->resource->start_in,
            "end_out"=>$this->resource->end_out,
            "total_hour"=>$this->resource->total_hour,
            "meet_client_at"=>$this->resource->meet_client_at,
            "client_appeared"=>$this->resource->client_appeared,
            "as_evidenced_by"=>$this->resource->as_evidenced_by,
            "RBT_modeled_and_demostrate"=>$this->resource->RBT_modeled_and_demostrate,
            "responding_this_session_could"=>$this->resource->responding_this_session_could,
            "progress_noted_this_session"=>$this->resource->progress_noted_this_session,
            "client_response_to_treatment"=>$this->resource->client_response_to_treatment,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
            
            

        ];
    }
}
