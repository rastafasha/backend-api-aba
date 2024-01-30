<?php

namespace App\Http\Controllers\admin;

use Carbon\Carbon;
use App\Models\Bip\Bip;
use Illuminate\Http\Request;
use App\Models\Patient\Patient;
use App\Models\Bip\ReductionGoal;
use App\Http\Controllers\Controller;
use App\Http\Resources\Bip\ReductionGoalsResource;
use App\Http\Resources\Bip\ReductionGoalsCollection;

class ReductionGoalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $goals = ReductionGoal::orderBy("id", "desc")
                            ->paginate(10);
                    
        return response()->json([
            "goals" => $goals ,
            // "goals" => ReductionGoalsResource::make($goals) ,
            
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
        // $bip = Bip::where("id", $request->bip_id)->first();
        // $reduction_goal = ReductionGoal::findOrFail($request->bip_id);

        
        if($request->date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->date );
            $request->request->add(["date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }

        $reduction_goal = ReductionGoal::create($request->all());
        
        
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
        $reduction_goal = ReductionGoal::findOrFail($id);

        return response()->json([
            // "patient" => $patient,
            "reduction_goal" => ReductionGoalsResource::make($reduction_goal),
            "documents_reviewed"=>json_decode($insurance-> documents_reviewed),
            "maladaptives"=>json_decode($insurance-> maladaptives),
            "assestment_conducted_options"=>json_decode($insurance-> assestment_conducted_options),
            "prevalent_setting_event_and_atecedents"=>json_decode($insurance-> prevalent_setting_event_and_atecedents),
            "interventions"=>json_decode($insurance-> interventions),
            
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
    public function showbyMaladaptive($goal)
    {
        $goalmaladaptives = ReductionGoal::where("goal", $goal)->first();
        return response()->json([
            "goalmaladaptives" => $goalmaladaptives,
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
        // $bip = ReductionGoal::findOrFail($request->client_id);
        // $request->request->add(["pa_services"=>json_encode($request->services)]);

        
        if($patient_is_valid){
            return response()->json([
                "message"=>403,
                "message_text"=> 'el paciente ya existe'
            ]);
        }
        
        $reduction_goal = ReductionGoal::findOrFail($id);
        
        
        if($request->date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->date );
            $request->request->add(["date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }

        
       
        $bip->update($request->all());
        
        // error_log($bip);

        // if($patient->person){
        //     $patient->person->update($request->all());
        // }
        return response()->json([
            "message"=>200,
            "bip"=>$bip,
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
