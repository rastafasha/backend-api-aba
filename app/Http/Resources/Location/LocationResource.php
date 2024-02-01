<?php

namespace App\Http\Resources\Location;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class LocationResource extends JsonResource
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
            "title"=>$this->resource->title,
            "address"=>$this->resource->address,
            "phone1"=>$this->resource->phone1,
            "phone2"=>$this->resource->phone2,
            "email"=>$this->resource->email,
            "city"=>$this->resource->city,
            "state"=>$this->resource->state,
            "zip"=>$this->resource->zip,
            // "doctor_id" =>$this->resource->doctor_id,
            // "doctor" =>$this->resource->doctor ? 
            //     [
            //         "id" =>$this->resource->doctor->id,
            //         "full_name" =>$this->resource->doctor->name.' '.$this->resource->doctor->surname,
            //         // "avatar"=> $this->resource->doctor->avatar ? env("APP_URL")."storage/".$this->resource->doctor->avatar : null,
            //         "avatar"=> $this->resource->doctor->avatar ? env("APP_URL").$this->resource->doctor->avatar : null,
            //         // "speciality_id" => $this->resource->doctor->speciality_id,
            //         //         "speciality"=>$this->resource->doctor->speciality ? [
            //         //             "id"=> $this->resource->doctor->speciality->id,
            //         //             "name"=> $this->resource->doctor->speciality->name,
            //         //             "price"=> $this->resource->doctor->speciality->price,
            //         //         ]:NULL,
            //     ]: NULL,
            // "client_id"=>$this->resource->client_id,
            // "client" =>$this->resource->client ?
            //     [
            //         "id" =>$this->resource->client->id,
            //         "first_name" =>$this->resource->client->first_name,
            //         "last_name" =>$this->resource->client->last_name,
            //         "full_name" =>$this->resource->client->first_name.' '.$this->resource->client->last_name,
            //         "phone" =>$this->resource->client->phone,
            //         "patientID" =>$this->resource->client->patientID,
            //         "name_companion" =>$this->resource->client->person->name_companion,
            //         "surname_companion" =>$this->resource->client->person->surname_companion,
            //     ]: NUll,
            
            
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,            

        ];
    }
}
