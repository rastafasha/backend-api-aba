<?php

namespace App\Http\Resources\RegistroClinico;

use Illuminate\Http\Resources\Json\ResourceCollection;

class RegistroClinCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "data"=> RegistroClinResource::collection($this->collection)
        ];
    }
}
