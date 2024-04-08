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
    public function index()
    {
        $clientReports = ClientReport::orderBy("id", "desc")
                            ->paginate(10);
        return response()->json([
            // "total"=>$patients->total(),
            // "billings"=> $billings
            "clientReports"=> ClientReportCollection::make($clientReports)
        ]);
    }

    public function config(){

        $insurances = Insurance::get();
        $users= User::orderBy("id", "desc")->get();

        return response()->json([
            "doctors"=>$users,
            "insurances"=>$insurances,
        ]);
    }
    // mostrar data por el paciente
    public function showByPatientId(Request $request)
    {
        $name_doctor = $request->search;
        $session_date = $request->session_date;
        $patient_id = $request->patient_id;
        $provider_name_g = $request->provider_name_g;

        $noteRbt = NoteRbt::where("patient_id", $patient_id) 
        ->orderby('session_date', 'desc')
        ->get();
        $noteBcba = NoteBcba::where("patient_id", $patient_id) 
        ->get();
        $patient = Patient::where("patient_id", $patient_id)->first();
        $doctor = NoteRbt::where("provider_name_g", $provider_name_g)->get();
        $clientReports = ClientReport::filterAdvance($name_doctor, $session_date)->where("patient_id", $patient_id)
        ->orderby('session_date', 'asc')
        ->get();
    
        return response()->json([
            "full_name"=> $patient->first_name.' '.$patient->last_name,
            "patient_id"=> $patient->patient_id,
            "insurer_id"=> $patient->insurer_id,
            "noteBcba" => NoteBcbaCollection::make($noteBcba),
            "noteBcba"=>$noteBcba->map(function($noteBcba){
                return[
                    "cpt_code"=> $noteBcba->cpt_code,
                ];
            }),
            "noteRbt" => NoteRbtCollection::make($noteRbt),
            "noteRbt"=>$noteRbt->map(function($noteRbt){
                return[
                    "id"=> $noteRbt->id,
                    "pos" => $noteRbt->pos,
                    "provider_name_g" => $noteRbt->provider_name_g,

                    "time_in" => ($noteRbt->time_in)/100,
                    "time_out" => ($noteRbt->time_out)/100,
                    "time_in2" => ($noteRbt->time_in2)/100,
                    "time_out2" => ($noteRbt->time_out2)/100,
                    "session_1" => ($noteRbt->time_out - $noteRbt->time_in)/100,
                    "session_2" => ($noteRbt->time_out2 - $noteRbt->time_in2)/100,
                    
                    "total_hours" => ($noteRbt->time_out - $noteRbt->time_in + $noteRbt->time_out2 - $noteRbt->time_in2)/100,
                    "total_units" => ($noteRbt->time_out - $noteRbt->time_in + $noteRbt->time_out2 - $noteRbt->time_in2)/100*4,

                    "session_date" => $noteRbt->session_date ? Carbon::parse($noteRbt->session_date)->format("Y-m-d") : NULL,
                ];
            }),

            "pa_assessments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : null,
            
        ]);

        
    }


   

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $clientReport = ClientReport::findOrFail($id);
        // $patient = Patient::where("patient_id", $patient_id)->first();

        return response()->json([
            "clientReport" => BillingResource::make($clientReport),
            
        ]);
    }
    //traer el perfil con los datos del insurer aplicados en el registro
    public function showProfile($patient_id)
    {
        $patient = Patient::where("patient_id", $patient_id)->first();
        $noteRbt = NoteRbt::where("patient_id", $patient_id)->get();


        return response()->json([
            // "patient" => $patient,
            // "noteRbt" => $noteRbt,
            "full_name"=> $patient->first_name.' '.$patient->last_name,
            "patient_id"=> $patient->patient_id,
            "insurer_id"=> $patient->insurer_id,
            "noteRbt" => NoteRbtCollection::make($noteRbt),
            "noteRbt"=>$noteRbt->map(function($noteRbt){
                return[
                    "id"=> $noteRbt->id,
                    "pos" => $noteRbt->pos,
                    "time_in" => $noteRbt->time_in,
                    "time_out" => $noteRbt->time_out,
                    "time_in2" => $noteRbt->time_in2,
                    "time_out2" => $noteRbt->time_out2,
                ];
            }),

            "pa_assessments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : null,
            
            // "bip" => BipResource::make($bip),
        ]);

        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    public function updateTotals(Request $request, $id)
    {
        $clientReport = ClientReport::findOrfail($id);
        $clientReport->billing_total = $request->billing_total;
        $clientReport->week_total_hours = $request->week_total_hours;
        $clientReport->week_total_units = $request->week_total_units;
        $clientReport->cpt_code = $request->cpt_code;
        $clientReport->insurer_id = $request->insurer_id;
        $clientReport->insurer_rate = $request->insurer_rate;
        $clientReport->update();
        return $clientReport;
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

}
