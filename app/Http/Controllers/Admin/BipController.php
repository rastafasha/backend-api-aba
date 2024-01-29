<?php

namespace App\Http\Controllers\admin;

use App\Models\Bip\Bip;
use Illuminate\Http\Request;
use App\Models\Patient\Patient;
use App\Http\Controllers\Controller;
use App\Http\Resources\Bip\BipResource;

class BipController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function config()
    {
        // $documents =[
        //     [
        //         "name"=>"Doctor Referal"
        //     ],
        //     [
        //         "name"=>"Medical Notes"
        //     ],
        //     [
        //         "name"=>"CDE"
        //     ],
        //     [
        //         "name"=>"IEP"
        //     ],
        //     [
        //         "name"=>"MNL"
        //     ],
        //     [
        //         "name"=>"Referal"
        //     ],
        // ];
        // $specialities = Specialitie::where("state",1)->get();

        return response()->json([
            "documents" => $documents,
            // "hours" => $hours,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $patient_is_valid = Patient::where("id", $request->id)->first();
        $bip = Bip::findOrFail($request->appointment_id);
        $request->request->add(["documents_reviewed"=>json_encode($request->documents_reviewed)]);
        // $appointment_attention = $bip->attention;

        // $request->request->add(["receta_medica"=>json_encode($request->medical)]);

        // if($appointment_attention){
        //     $appointment_attention->update($request->all());

        //     if(!$appointment->date_attention){
        //         $appointment->update(["status"=>2,"date_attention" =>now()]);
        //     }
        // }else{
        //     AppointmentAttention::create($request->all());

        //     date_default_timezone_set('America/Caracas');
        //     $appointment->update(["status"=>2,"date_attention" =>now()]);
            
        // }

        $bip = Bip::create($request->all());
        // $request->request->add([
        //     "clent_id" =>$patient->id
        // ]);
        
        return response()->json([
            "message"=>200,
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
        $bip = Bip::findOrFail($id);

        return response()->json([
            // "patient" => $patient,
            "bip" => BipResource::make($bip),
            "documents_reviewed"=>json_decode($insurance-> documents_reviewed),
        ]);
        
        
    }
    public function showbyProfile($id)
    {
        $patient = Patient::where("id", $id)->first();
        return response()->json([
            "patient" => $patient,
            // "bip" => BipResource::make($bip),
        ]);

        
    }

    public function query_patient(Request $request)
    {
        $client_id =$request->get("client_id");

        $patient = Patient::where("client_id", $client_id)->first();

        if(!$patient){
            return response()->json([
                "message"=>403,
            ]);
        }

        return response()->json([
            "message"=>200,
            "id"=>$patient->id,
            "name"=>$patient->name,
            "surname"=>$patient->surname,
            "phone"=>$patient->phone,
            "client_id"=>$patient->client_id,
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
        $patient_is_valid = Patient::where("id", "<>", $id)->where("client_id", $request->client_id)->first();
        
        // $request->request->add(["pa_services"=>json_encode($request->services)]);

        $request->request->add(["documents_reviewed"=>json_encode($request->documents_reviewed)]);

        if($patient_is_valid){
            return response()->json([
                "message"=>403,
                "message_text"=> 'el paciente ya existe'
            ]);
        }
        
        $bip = Bip::findOrFail($id);
        // if($request->hasFile('imagen')){
        //     if($patient->avatar){
        //         Storage::delete($patient->avatar);
        //     }
        //     $path = Storage::putFile("patients", $request->file('imagen'));
        //     $request->request->add(["avatar"=>$path]);
        // }
        
        // if($request->birth_date){
        //     $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->birth_date );
        //     $request->request->add(["birth_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        // }

        // if($request->pa_assessment_start_date){
        //     $date_clean1 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_assessment_start_date );
        //     $request->request->add(["pa_assessment_start_date" => Carbon::parse($date_clean1)->format('Y-m-d h:i:s')]);
        // }

        // if($request->pa_assessment_end_date){
        //     $date_clean2 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_assessment_end_date );
        //     $request->request->add(["pa_assessment_end_date" => Carbon::parse($date_clean2)->format('Y-m-d h:i:s')]);
        // }
        
        // if($request->pa_services_start_date){
        //     $date_clean3 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_services_start_date );
        //     $request->request->add(["pa_services_start_date" => Carbon::parse($date_clean3)->format('Y-m-d h:i:s')]);
        // }
        
        // if($request->pa_services_end_date){
        //     $date_clean4 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_services_end_date );
        //     $request->request->add(["pa_services_end_date" => Carbon::parse($date_clean4)->format('Y-m-d h:i:s')]);
        // }
        // if($request->elegibility_date){
        //     $date_clean5 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->elegibility_date );
        //     $request->request->add(["elegibility_date" => Carbon::parse($date_clean5)->format('Y-m-d h:i:s')]);
        // }
       
        $bip->update($request->all());
        
        // error_log($bip);

        // if($patient->person){
        //     $patient->person->update($request->all());
        // }
        return response()->json([
            "message"=>200,
            "bip"=>$bip
        ]);
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
