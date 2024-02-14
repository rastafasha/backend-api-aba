<?php

namespace App\Http\Resources\Bip;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class SustitutionGoalsResource extends JsonResource
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
            "maladaptive"=>$this->resource->maladaptive,
            "patient_id"=>$this->resource->patient_id,
            "current_sustitution"=>$this->resource->current_sustitution,
            "bip_id"=>$this->resource->bip_id,
            "description"=>$this->resource->description,
            "goalstos"=>json_decode($this->resource->goalstos) ? : null,
            "goalltos"=>json_decode($this->resource->goalltos) ? : null,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,            

        ];
    }
}
