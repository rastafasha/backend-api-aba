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

        // $DOCUMENTS = collect([]);
        // $documents = [];
        // $document_name["Doctor Referal"] = "table-primary";
        // $document_name["Medical Notes"] = "table-secondary";
        // $document_name["CDE"] = "table-success";
        // $document_name["IEP"] = "table-warning";
        // $document_name["MNL"] = "table-info";
        // $document_name["Referal"] = "table-info";
        // $names_document = "";

        // foreach ($this->resource->bip_files as $key => $bip_file) {
        //     $names_document .= ($bip_file->doc."-");
        //     foreach ($bip_files->doc_files as $key => $doc_files) {
        //         $DOCUMENTS->push([
        //             "name"=> $bip_files->document_name,
        //             "doc"=> [
        //                 "doc"=> $bip_files->doc,
        //                 "class"=> $document_name[$schedule_day->day],
        //                 // "size"=> $file->size,
        //                 // "file"=> $file->file,
        //                 "documents_recev"=> [
        //                     "name" => $doc_files->name,
            
        //                     "items" => []
        //                 ],

        //                 'files'=>$this->resource-> file->map(function($file){
        //                     return [
        //                         'id'=> $file->id,
        //                         'client_id'=> $file->client_id,
        //                         'name_file'=> $file->name_file,
        //                         'size'=> $file->size,
        //                         'file'=> env("APP_URL")."storage/".$file->file,
        //                         'type'=> $file->type,
        //                     ];
        //                 })
        //             ],
                    
        //         ]);
        //     }
        // }
        return [
            "id"=>$this->resource->id,
            "type_of_assessment"=>$this->resource->type_of_assessment,
            'documents_reviewed'=> json_decode($this->resource-> documents_reviewed),
            "client_id"=>$this->resource->client_id,
            "doctor_id" =>$this->resource->doctor_id,
            "doctor" =>$this->resource->doctor ? 
                [
                    "id" =>$this->resource->doctor->id,
                    "full_name" =>$this->resource->doctor->name.' '.$this->resource->doctor->surname,
                    // "avatar"=> $this->resource->doctor->avatar ? env("APP_URL")."storage/".$this->resource->doctor->avatar : null,
                    "avatar"=> $this->resource->doctor->avatar ? env("APP_URL").$this->resource->doctor->avatar : null,
                    "speciality_id" => $this->resource->doctor->speciality_id,
                            "speciality"=>$this->resource->doctor->speciality ? [
                                "id"=> $this->resource->doctor->speciality->id,
                                "name"=> $this->resource->doctor->speciality->name,
                                "price"=> $this->resource->doctor->speciality->price,
                            ]:NULL,
                ]: NULL,
            
            "patient" =>$this->resource->patient ?
                [
                    "id" =>$this->resource->patient->id,
                    "first_name" =>$this->resource->patient->first_name,
                    "last_name" =>$this->resource->patient->last_name,
                    "full_name" =>$this->resource->patient->first_name.' '.$this->resource->patient->last_name,
                    "phone" =>$this->resource->patient->phone,
                    "n_doc" =>$this->resource->patient->n_doc,
                    "name_companion" =>$this->resource->patient->person->name_companion,
                    "surname_companion" =>$this->resource->patient->person->surname_companion,
                ]: NUll,
            "background_information"=>$this->resource->background_information,
            "previus_treatment_and_result"=>$this->resource->previus_treatment_and_result,
            "current_treatment_and_progress"=>$this->resource->current_treatment_and_progress,
            "education_status"=>$this->resource->education_status,
            "phisical_and_medical_status"=>$this->resource->phisical_and_medical_status,
            'maladaptives'=> json_decode($this->resource-> maladaptives),
            "assestment_conducted"=>$this->resource->assestment_conducted,
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
