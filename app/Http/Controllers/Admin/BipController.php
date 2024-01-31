<?php

namespace App\Http\Controllers\admin;

use App\Models\User;
use App\Models\Bip\Bip;
use Illuminate\Http\Request;
use App\Models\Patient\Patient;
use App\Http\Controllers\Controller;
use App\Http\Resources\Bip\BipResource;
use App\Http\Resources\Bip\BipCollection;

class BipController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $patient_id = $request->patient_id;
        $name_doctor = $request->search;
        $date = $request->date;

        $appointments = Appointment::filterAdvanceBip($patient_id, $name_doctor, $date)->orderBy("id", "desc")
                            ->paginate(10);
        return response()->json([
            "total"=>$appointments->total(),
            "appointments"=> AppointmentCollection::make($appointments)
        ]);

        // $bips = Bip::orderBy("id", "desc")
        //                     ->paginate(10);
                    
        // return response()->json([
        //     // "total"=>$payments->total(),
        //     "bips" => BipCollection::make($bips) ,
            
        // ]); 
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $patient = null;
        $patient = Patient::where("patient_id", $request->patient_id)->first();
        $doctor = User::where("id", $request->doctor_id)->first();

        $request->request->add(["documents_reviewed"=>json_encode($request->documents_reviewed)]);
        $request->request->add(["maladaptives"=>json_encode($request->maladaptives)]);
        $request->request->add(["assestment_conducted_options"=>json_encode($request->assestment_conducted_options)]);
        $request->request->add(["prevalent_setting_event_and_atecedents"=>json_encode($request->prevalent_setting_event_and_atecedents)]);
        $request->request->add(["interventions"=>json_encode($request->interventions)]);

        $bip = Bip::create($request->all());
        
        
        return response()->json([
            "message"=>200,
            "bip"=>$bip,
            "type_of_assessment" =>$bip->type_of_assessment,
            "documents_reviewed"=>json_decode($bip-> documents_reviewed),
            "maladaptives"=>json_decode($bip-> maladaptives),
            "assestment_conducted_options"=>json_decode($bip-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($bip-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($bip-> interventions),
            "client_id"=>$bip->client_id,
            "patient_id"=>$bip->patient_id,
            "doctor_id" => $bip->doctor_id,
            "doctor"=>$bip->doctor_id ? 
                        [
                            "id"=> $doctor->id,
                            "email"=> $doctor->email,
                            "full_name" =>$doctor->name.' '.$doctor->surname,
                        ]: NULL,
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
            "id"=>$bip->id,
            "bip" => BipResource::make($bip),
            "type_of_assessment" =>$bip->type_of_assessment,
            "documents_reviewed"=>json_decode($bip-> documents_reviewed),
            "maladaptives"=>json_decode($bip-> maladaptives),
            "assestment_conducted_options"=>json_decode($bip-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($bip-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($bip-> interventions),
            
        ]);
        
        
    }
    //se obtiene el usuario
    public function showProfile($id)
    {
        $patient = Patient::where("id", $id)->first();
        return response()->json([
            "patient" => $patient,
            // "bip" => BipResource::make($bip),
        ]);

        
    }

    //se obtiene el bip del usuario
    public function showbyUser($client_id)
    {
        $bip = Bip::where("client_id", $client_id)->first();
        // $patient = Patient::where("id", $id)->first();
        return response()->json([
            "id"=>$bip->id,
            "bip" => $bip,
            // "bip" => BipResource::make($bip),
            "type_of_assessment" =>$bip->type_of_assessment,
            "documents_reviewed"=>json_decode($bip-> documents_reviewed),
            "maladaptives"=>json_decode($bip-> maladaptives),
            "assestment_conducted_options"=>json_decode($bip-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($bip-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($bip-> interventions),
        ]);

        
    }

    //filtro por  patient_id o n_doc para busquedas y asiganciones al paciente
    public function query_patient(Request $request)
    {
        $patient_id =$request->get("patient_id");

        $patient = Patient::where("patient_id", $patient_id)->first();

        if(!$patient){
            return response()->json([
                "message"=>403,
            ]);
        }

        return response()->json([
            "message"=>200,
            "id"=>$patient->id,
            "first_name"=>$patient->first_name,
            "last_name"=>$patient->last_name,
            "phone"=>$patient->phone,
            "patient_id"=>$patient->patient_id,
        ]);

    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $client_id)
    {
        // $bip = Bip::findOrFail("client_id", $client_id)->first();
        $bip = Bip::findOrFail($client_id);

        $request->request->add(["documents_reviewed"=>json_encode($request->documents_reviewed)]);
        $request->request->add(["maladaptives"=>json_encode($request->maladaptives)]);
        $request->request->add(["assestment_conducted_options"=>json_encode($request->assestment_conducted_options)]);
        $request->request->add(["prevalent_setting_event_and_atecedents"=>json_encode($request->prevalent_setting_event_and_atecedents)]);
        $request->request->add(["interventions"=>json_encode($request->interventions)]);

        $bip = Bip::update($request->all());
        
        
        return response()->json([
            "message"=>200,
            "bip"=>$bip,
            "type_of_assessment" =>$bip->type_of_assessment,
            "documents_reviewed"=>json_decode($bip-> documents_reviewed),
            "maladaptives"=>json_decode($bip-> maladaptives),
            "assestment_conducted_options"=>json_decode($bip-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($bip-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($bip-> interventions),
            "doctor_id" => $bip->doctor_id,
            "doctor"=>$bip->doctor_id ? 
                        [
                            "id"=> $doctor->id,
                            "email"=> $doctor->email,
                            "full_name" =>$doctor->name.' '.$doctor->surname,
                        ]: NULL,
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
