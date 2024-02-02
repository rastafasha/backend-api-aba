<?php

namespace App\Http\Resources\Bip;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class ReductionGoalsResource extends JsonResource
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
            "sto"=>$this->resource->sto,
            "bip_id"=>$this->resource->bip_id,
            "goal_id"=>$this->resource->goal_id,
            "patient_id"=>$this->resource->patient_id,
            "bips" =>$this->resource->bips ?
                [
                    "id" =>$this->resource->bips->id,
                    'maladaptives'=> json_decode($this->resource->maladaptives),
                    
                ]: NUll,
            "goal"=>$this->resource->goal,
            "decription_goal"=>$this->resource->decription_goal,
            "status"=>$this->resource->status,
            "lto"=>$this->resource->lto,
            "description_lto"=>$this->resource->description_lto,
            "status_lto"=>$this->resource->status_lto,
            "date_lto"=>$this->resource->date_lto ? Carbon::parse($this->resource->date_lto)->format("Y-m-d h:i A") : NULL,            
            "date"=>$this->resource->date ? Carbon::parse($this->resource->date)->format("Y-m-d h:i A") : NULL,            
            
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,            

        ];
    }
}
