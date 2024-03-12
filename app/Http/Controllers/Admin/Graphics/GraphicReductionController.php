<?php

namespace App\Http\Controllers\Admin\Graphics;

use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Notes\NoteRbt;
use App\Models\Patient\Patient;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Resources\Note\NoteRbtResource;
use App\Http\Resources\Note\NoteRbtCollection;

class GraphicReductionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function config(){
        $users= User::orderBy("id", "desc")
        // ->whereHas("roles", function($q){
        //     $q->where("name","like","%DOCTOR%");
        // })
        ->get();

        return response()->json([
            "doctors"=>$users->map(function($user){
                return[
                    "id"=> $user->id,
                    "full_name"=> $user->name.' '.$user->surname,
                ];
            })
        ]);
    }
    


    public function configPatients(){
        $patients= Patient::orderBy("id", "desc")->get();

        return response()->json([
            "patients"=>$patients->map(function($patients){
                return[
                    "id"=> $patients->id,
                    "full_name"=> $patients->first_name.' '.$patients->last_name,
                ];
            })
        ]);
    }

    public function show($id)
    {
        $noteRbt = NoteRbt::findOrFail($id);
        $doctor = User::where("status",'active')->get();

        return response()->json([
            // "noteRbt" => NoteRbtResource::make($noteRbt),
            "session_date" => $noteRbt->session_date,
            "interventions"=>json_decode($noteRbt-> interventions),
            "maladaptives"=>json_decode($noteRbt-> maladaptives),
            "replacements"=>json_decode($noteRbt-> replacements),

            
            // "maladaptives"=>json_decode($noteRbt-> maladaptives),
            
            
            
        ]);
    }


    public function showbyPatientId(Request $request, $patient_id)
    {

        $noteRbt = NoteRbt::where("patient_id", $request->patient_id)->get();
        
    
        return response()->json([
            // "id"=>$noteRbt->id,
            // "noteRbt" => $noteRbt,
            "noteRbt" => NoteRbtCollection::make($noteRbt),
            // "bip" => BipResource::make($bip),
            // "session_date" =>$noteRbt->session_date,
            // "maladaptives"=>json_decode($noteRbt-> maladaptives),
            // "replacements"=>json_decode($noteRbt-> replacements),
            
            
        ]);
    }

    public function showPatientId($patient_id)
    {
        $patient = Patient::where("patient_id", $patient_id)->first();
        
    
        return response()->json([
            "patient" => $patient,
            
            
        ]);

        
    }

    public function showGragphicbyMaladaptive(Request $request, string $maladaptives ,$patient_id)
    {
        $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();

        // $noteRbt = NoteRbt::where("patient_id", $request->patient_id)->get();
        // $noteRbt = NoteRbt::findOrFail($maladaptives);
        //no me reconoce  el request como un json en 
        $noteRbt = NoteRbt::where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
        ->where("patient_id", $request->patient_id)->get();
        //aqui trae la lista completa
        // $noteRbt = NoteRbt::get(); 
        
        return response()->json([
            // "noteRbt" => $noteRbt,
            "noteRbt" => NoteRbtCollection::make($noteRbt) ,
            
            // "session_date" => $noteRbt->session_date,
            // "maladaptives" => $maladaptives,
            //Property [maladaptive_behavior] does not exist on this collection instance. 
            // "maladaptives"=>json_decode($noteRbt-> maladaptives),
        ],201);



        
    }


    public function graphic_patient_month(Request $request){

        $month = $request->month;
        $patient_id = $request->patient_id;

        $query_patient_notes_by_month = DB::table("note_rbts")->where("note_rbts.deleted_at",NULL)
                        ->whereMonth("note_rbts.session_date", $month)
                        ->where("note_rbts.patient_id", $patient_id)
                        ->join("patients","note_rbts.patient_id", "=", "patients.patient_id")
                        ->select(
                            DB::raw("MONTH(note_rbts.session_date) as month"),
                        )->groupBy("month")
                        ->orderBy("month")
                        ->get();
                        
        return response()->json([
            "query_patient_notes_by_month" => $query_patient_notes_by_month,
        ]);               
    }

    
    

    
}
