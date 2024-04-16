<?php

namespace App\Http\Controllers\Admin\Billing;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Notes\NoteRbt;
use App\Models\Notes\NoteBcba;
use App\Models\Patient\Patient;
use App\Models\Insurance\Insurance;
use App\Http\Controllers\Controller;
use App\Models\Billing\ClientReport;
use App\Http\Resources\Bip\BipResource;
use App\Http\Resources\User\UserCollection;
use App\Http\Resources\Note\NoteRbtResource;
use App\Http\Resources\Note\NoteRbtCollection;
use App\Http\Resources\Billing\BillingResource;
use App\Http\Resources\Note\NoteBcbaCollection;
use App\Http\Resources\Billing\BillingCollection;
use App\Http\Resources\Insurance\InsuranceCollection;
use App\Http\Resources\Billing\ClientReport\ClientReportCollection;

class ClientReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   

    // mostrar data por el paciente
    public function showByPatientId(Request $request)
    {
        $name_doctor = $request->search;
        $session_date = $request->session_date;
        $patient_id = $request->patient_id;
        $id = $request->provider_name_g;
        $provider_name_g = $request->provider_name_g;

        $sponsor = User::where("id", $id)->get();
        
        $doctor = NoteRbt::where("provider_name_g", $id)->get();
        
        if ($name_doctor != ""){
            $doctor = $this->filterDoctorName($doctor,$name_doctor);
        }
        if ($session_date != ""){
            $doctor = $this->filterDate($doctor,$session_date);
        }

        $patient = Patient::where("patient_id", $patient_id)->first();
        
        $noteRbt = NoteRbt::where("patient_id", $patient_id) 
        ->orderby('session_date', 'desc')
        ->get();
        
        $noteBcba = NoteBcba::where("patient_id", $patient_id) 
        ->get();
        

        $clientReports = ClientReport::filterAdvance($name_doctor, $session_date)->where("patient_id", $patient_id)
        ->orderby('session_date', 'asc')
        ->get();

       

        // funcion de angel
        $timeIn = Carbon::parse($noteRbt->time_in);
        $timeOut = Carbon::parse($noteRbt->time_out);

        $diferencia = $timeOut->diff($timeIn);


        $timeIn2 = Carbon::parse($noteRbt->time_in2);
        $timeOut2 = Carbon::parse($noteRbt->time_out2);

        $diferencia2 = $timeOut2->diff($timeIn2);
        
        $horas = $diferencia->h;
        $minutos = $diferencia->i;
        
        $horas2 = $diferencia2->h;
        $minutos2 = $diferencia2->i;


        /**sfdsd */
        $minutosTotales1 = $diferencia->h * 60 + $diferencia->i;

        $minutosTotales2 = $diferencia2->h * 60 + $diferencia2->i;
    
        $unidades1 = round($minutosTotales1 / 15);
        $unidades2 = round($minutosTotales2 / 15);


        $duracionTotalMinutos = $diferencia->h * 60 + $diferencia->i + $diferencia2->h * 60 + $diferencia2->i;

        $horas = floor($duracionTotalMinutos / 60);
        $minutos = $duracionTotalMinutos % 60;


        $diferenciaTotal = "$horas horas, $minutos minutos";

        $totalUnidades = $unidades1 + $unidades2;

        $costoUnidad = 12.51;

        $pagar = $totalUnidades * $costoUnidad;
        // fin funcion de angel
        
        return response()->json([
            // funcion de angel
            'Session 1' => "Diferencia: $horas horas, $minutos minutos",
            'Unidad sesion 1' => "Unidades: $unidades1",
            'Session 2' => "Diferencia: $horas2 horas, $minutos2 minutos",
            'Unidad sesion 2' => "Unidades: $unidades2",
            'Total de minutos' => "Total de minutos $diferenciaTotal",
            'Total de Unidades' => "Total de unidades $totalUnidades",
            'Pagar' => $pagar,
            // fin funcion de angel

            "full_name"=> $patient->first_name.' '.$patient->last_name,
            "patient_id"=> $patient->patient_id,
            "insurer_id"=> $patient->insurer_id,
            
            "noteRbt" => NoteRbtCollection::make($noteRbt),
            "noteRbt"=>$noteRbt->map(function($noteRbt)use ($sponsor){
                return[
                    "id"=> $noteRbt->id,
                    "pos" => $noteRbt->pos,
                    "provider_name_g" => $noteRbt->provider_name_g,
                    // traer el nombre del doctor desde la relacion sponsor
                    "sponsor"=>$noteRbt->provider_name_g? [
                        "id"=> $noteRbt->provider_name_g,
                        // "doctorId" => $sponsor->id,
                        // "doctorName" => $sponsor->name,
                    ]:NULL,

                    "time_in" => ($noteRbt->time_in),
                    "time_out" => ($noteRbt->time_out),
                    "time_in2" => ($noteRbt->time_in2),
                    "time_out2" => ($noteRbt->time_out2),

                    "session_1" => date("H:i", strtotime($noteRbt->time_out) - strtotime($noteRbt->time_in) ),
                    "session_2" => date("H:i", strtotime($noteRbt->time_out2) - strtotime($noteRbt->time_in2) ),
                    // "session_f2" => ($noteRbt->time_out2 - $noteRbt->time_in2/100)*1.66666666666667,

                    "total_hours" => date("H:i", strtotime($noteRbt->time_out2) - strtotime($noteRbt->time_in2) + strtotime($noteRbt->time_out) - strtotime($noteRbt->time_in) ),
                    //1
                    "hour_to_minute" => strtotime(strtotime(date("H:i", strtotime($noteRbt->time_out2) - strtotime($noteRbt->time_in2) + strtotime($noteRbt->time_out) - strtotime($noteRbt->time_in)) ) *60)*24,
                    //
                    "total_hoursFactor" => strtotime(date("H:i", strtotime($noteRbt->time_out2) - strtotime($noteRbt->time_in2) + strtotime($noteRbt->time_out) - strtotime($noteRbt->time_in)) ) *1.66666666666667,
                    "total_units" => (strtotime(strtotime(date("H:i", strtotime($noteRbt->time_out2) - strtotime($noteRbt->time_in2) + strtotime($noteRbt->time_out) - strtotime($noteRbt->time_in)) ) *60)*24)*1.66666666666667 /100 *4,
                    
                    "session_date" => $noteRbt->session_date ? Carbon::parse($noteRbt->session_date)->format("Y-m-d") : NULL,
                ];
            }),
            "noteBcba" => NoteBcbaCollection::make($noteBcba),
            "noteBcba"=>$noteBcba->map(function($noteBcba){
                return[
                    "cpt_code"=> $noteBcba->cpt_code,
                ];
            }),
            "pa_assessments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : null,
            
        ]);

        
    }





    public function contadorShow($id)
    {
        $contador = Contador::find($id);

        $timeIn = Carbon::parse($contador->time_in);
        $timeOut = Carbon::parse($contador->time_out);

        $diferencia = $timeOut->diff($timeIn);


        $timeIn2 = Carbon::parse($contador->time_in2);
        $timeOut2 = Carbon::parse($contador->time_out2);

        $diferencia2 = $timeOut2->diff($timeIn2);
        
        $horas = $diferencia->h;
        $minutos = $diferencia->i;
        
        $horas2 = $diferencia2->h;
        $minutos2 = $diferencia2->i;


        /**sfdsd */
        $minutosTotales1 = $diferencia->h * 60 + $diferencia->i;

        $minutosTotales2 = $diferencia2->h * 60 + $diferencia2->i;
    
        $unidades1 = round($minutosTotales1 / 15);
        $unidades2 = round($minutosTotales2 / 15);


        $duracionTotalMinutos = $diferencia->h * 60 + $diferencia->i + $diferencia2->h * 60 + $diferencia2->i;

        $horas = floor($duracionTotalMinutos / 60);
        $minutos = $duracionTotalMinutos % 60;


        $diferenciaTotal = "$horas horas, $minutos minutos";

        $totalUnidades = $unidades1 + $unidades2;

        $costoUnidad = 12.51;

        $pagar = $totalUnidades * $costoUnidad;

        return [
            'Session 1' => "Diferencia: $horas horas, $minutos minutos",
            'Unidad sesion 1' => "Unidades: $unidades1",
            'Session 2' => "Diferencia: $horas2 horas, $minutos2 minutos",
            'Unidad sesion 2' => "Unidades: $unidades2",
            'Total de minutos' => "Total de minutos $diferenciaTotal",
            'Total de Unidades' => "Total de unidades $totalUnidades",
            'Pagar' => $pagar
        ];

    }

}
