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
        // $bip = Bip::findOrFail($request->client_id);
        
        $request->request->add(["documents_reviewed"=>json_encode($request->documents_reviewed)]);
        $request->request->add(["maladaptives"=>json_encode($request->maladaptives)]);
        $request->request->add(["assestment_conducted_options"=>json_encode($request->assestment_conducted_options)]);
        $request->request->add(["prevalent_setting_event_and_atecedents"=>json_encode($request->prevalent_setting_event_and_atecedents)]);
        $request->request->add(["interventions"=>json_encode($request->interventions)]);

        
        $bip = Bip::create($request->all());
        
        
        return response()->json([
            "message"=>200,
            "bip"=>$bip,
            "documents"=>json_decode($bip-> documents),
            "maladaptives"=>json_decode($bip-> maladaptives),
            "assestment_conducted_options"=>json_decode($bip-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($bip-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($bip-> interventions),
        ]);


        // $patient = null;
        // $patient = Patient::where("client_id", $request->id)->first();
        // $doctor = User::where("id", $request->doctor_id)->first();


       
        // $bip = Bip::create([
        //     "doctor_id" =>$request->doctor_id,
        //     "client_id" =>$patient->id,
        //     "documents"=>json_decode($bip-> documents),
        //     "maladaptives"=>json_decode($bip-> maladaptives),
        //     "assestment_conducted_options"=>json_decode($bip-> assestment_conducted_options),
        //     "prevalent_setting_event_and_atecedents"=>json_decode($bip-> prevalent_setting_event_and_atecedents),
        //     "interventions"=>json_decode($bip-> interventions),
        // ]);


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
            "maladaptives"=>json_decode($insurance-> maladaptives),
            "assestment_conducted_options"=>json_decode($insurance-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($insurance-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($insurance-> interventions),
            
        ]);
        
        
    }
    public function showProfile($id)
    {
        $patient = Patient::where("id", $id)->first();
        return response()->json([
            "patient" => $patient,
            // "bip" => BipResource::make($bip),
        ]);

        
    }

    public function showbyUser($client_id)
    {
        $bip = Bip::where("client_id", $client_id)->first();
        // $patient = Patient::where("id", $id)->first();
        return response()->json([
            "bip" => $bip,
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

        // $patient_is_valid = Bip::where("id", "<>", $id)->where("client_id", $request->client_id)->first();
        $patient_id = Bip::where("id", "<>", $id)->where("client_id", $request->client_id)->first();
        
        $request->request->add(["documents_reviewed"=>json_encode($request->documents_reviewed)]);
        $request->request->add(["maladaptives"=>json_encode($request->maladaptives)]);
        $request->request->add(["assestment_conducted_options"=>json_encode($request->assestment_conducted_options)]);
        $request->request->add(["prevalent_setting_event_and_atecedents"=>json_encode($request->prevalent_setting_event_and_atecedents)]);
        $request->request->add(["interventions"=>json_encode($request->interventions)]);

        // if($patient_is_valid){
        //     return response()->json([
        //         "message"=>200,
        //         "message_text"=> 'el paciente ya existe'
        //     ]);
        // }
        
        $bip = Bip::findOrFail($patient_id);
        $bip->update($request->all());
        

       
        
        error_log($bip);

        // if($patient->person){
        //     $patient->person->update($request->all());
        // }
        return response()->json([
            "message"=>200,
            "bip"=>$bip,
            "documents"=>json_decode($bip->documents),
            "maladaptives"=>json_decode($bip->maladaptives),
            "assestment_conducted_options"=>json_decode($bip-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($bip-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($bip-> interventions),
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
