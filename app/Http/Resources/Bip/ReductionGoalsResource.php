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
            // "client_id"=>$this->resource->client_id,
            "bip_id"=>$this->resource->bip_id,
            "bips" =>$this->resource->bips ?
                [
                    "id" =>$this->resource->bips->id,
                    'maladaptives'=> json_decode($this->resource->maladaptives),
                    
                ]: NUll,
            "goal"=>$this->resource->goal,
            "description"=>$this->resource->description,
            "status"=>$this->resource->status,
            "date"=>$this->resource->date ? Carbon::parse($this->resource->date)->format("Y-m-d h:i A") : NULL,            
            
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,            

        ];
    }
}
