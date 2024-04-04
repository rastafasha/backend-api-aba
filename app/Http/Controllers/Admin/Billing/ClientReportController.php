<?php

namespace App\Http\Controllers\Admin\Billing;

use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Patient\Patient;
use App\Models\Insurance\Insurance;
use App\Http\Controllers\Controller;
use App\Models\Billing\ClientReport;
use App\Http\Resources\Bip\BipResource;
use App\Http\Resources\Note\NoteRbtResource;
use App\Http\Resources\Billing\BillingResource;
use App\Http\Resources\Billing\BillingCollection;
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
            // "doctors"=>$users->map(function($user){
            //     return[
            //         "id"=> $user->id,
            //         "full_name"=> $user->name.' '.$user->surname,
            //     ];
            // }),
            // "patients"=>$patients->map(function($patient){
            //     return[
            //         "id"=> $user->id,
            //         "full_name"=> $patient->name.' '.$patient->surname,
            //     ];
            // })
        ]);
    }
    // mostrar data por el paciente
    public function showByPatientId($patient_id)
    {
        $clientReports = ClientReport::where("patient_id", $patient_id)
        ->orderby('date', 'desc')
        // ->groupby('date')
        // ->selectRaw('sum(total_hours) as total, date')
        ->get();
        // $patient = Patient::where("patient_id", $patient_id)->first();
    
        return response()->json([
            "clientReports" => $clientReports,
            // "billings" => BillingCollection::make($billings),
        ]);

        
    }
    //mostrar al paciente
    public function showPatientId($patient_id)
    {
        $patient_is_valid = ClientReport::where("patient_id", $request->patient_id)->first();
        $patient = Patient::where("patient_id", $patient_id)->orderby('date', 'desc')
        // ->groupby('date')
        // ->selectRaw('sum(total_hours) as total, date')
        ->get();
        // $patient = Patient::where("patient_id", $patient_id)->first();
    
        return response()->json([
            // "note_rbts" => NoteRbtResource::make($note_rbts),
            "clientReports" => ClientReportCollection::make($clientReports),
            // "note_rbts" => $note_rbts,
            // "patient" => $patient,
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
        return response()->json([
            "patient" => $patient,
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
