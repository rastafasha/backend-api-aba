<?php

namespace App\Http\Resources\Bip;

use Illuminate\Http\Resources\Json\JsonResource;

class BipFileResource extends JsonResource
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
            'client_id'=>$this->resource->client_id,
            'name'=>$this->resource-> name,
            // 'vimeo_id'=>$this->resource-> vimeo_id ? "https://player.vimeo.com/video/".$this->resource-> vimeo_id : NULL,
            // 'time'=>$this->resource-> time,
            // 'time_course'=>$this->resource-> time_course,
            'state'=>$this->resource-> state,
            'files'=>$this->resource-> files->map(function($file){
                return [
                    'id'=> $file->id,
                    'client_id'=> $file->client_id,
                    'name_file'=> $file->name_file,
                    'size'=> $file->size,
                    'file'=> env("APP_URL")."storage/".$file->file,
                    'type'=> $file->type,
                ];
            })
        ];
    }
}
