<?php

namespace App\Http\Controllers\Patient;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Patient\Patient;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use App\Models\Insurance\Insurance;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Models\Patient\PatientPerson;
use App\Models\Appointment\Appointment;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Patient\PatientResource;
use App\Http\Resources\Patient\PatientCollection;
use App\Http\Resources\Appointment\AppointmentCollection;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search = $request->search;

        $patients = Patient::where(DB::raw("CONCAT(patients.first_name,' ', IFNULL(patients.last_name,''),' ',patients.email)"),
        "like","%".$search."%"
        )->orderBy("id", "desc")
        ->paginate(20);
                    
        return response()->json([
            "total" =>$patients->total(),
            "patients" => PatientCollection::make($patients),
            
        ]);          
    }

    public function config()
    {
        // $roles = Role::where("name","like","%DOCTOR%")->get();
        $specialists = User::where("status",'active')->get();
        $insurances = Insurance::get();
        
        return response()->json([
            "specialists" => $specialists,
            "insurances" => $insurances,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function profile($id)
    {
       
        $data_patient = [];
        $patient = Patient::findOrFail($id);
    
            
            $data_patient = [
                "patient" => PatientResource::make($patient),
                "services"=>$patient->pa_services ? json_decode($patient->pa_services) : [],
            ];

        return response()->json($data_patient);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $patient_is_valid = Patient::where("pat_id", $request->pat_id)->first();
        
        $request->request->add(["pa_services"=>json_encode($request->services)]);

        if($patient_is_valid){
            return response()->json([
                "message"=>403,
                "message_text"=> 'el paciente ya existe'
            ]);
        }

        if($request->hasFile('imagen')){
            $path = Storage::putFile("patients", $request->file('imagen'));
            $request->request->add(["avatar"=>$path]);
        }

        if($request->birth_date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->birth_date );
            $request->request->add(["birth_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }

        if($request->pa_assessment_start_date){
            $date_clean1 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_assessment_start_date );
            $request->request->add(["pa_assessment_start_date" => Carbon::parse($date_clean1)->format('Y-m-d h:i:s')]);
        }

        if($request->pa_assessment_end_date){
            $date_clean2 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_assessment_end_date );
            $request->request->add(["pa_assessment_end_date" => Carbon::parse($date_clean2)->format('Y-m-d h:i:s')]);
        }
        
        if($request->pa_services_start_date){
            $date_clean3 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_services_start_date );
            $request->request->add(["pa_services_start_date" => Carbon::parse($date_clean3)->format('Y-m-d h:i:s')]);
        }
        
        if($request->pa_services_end_date){
            $date_clean4 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_services_end_date );
            $request->request->add(["pa_services_end_date" => Carbon::parse($date_clean4)->format('Y-m-d h:i:s')]);
        }
        if($request->elegibility_date){
            $date_clean5 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->elegibility_date );
            $request->request->add(["elegibility_date" => Carbon::parse($date_clean5)->format('Y-m-d h:i:s')]);
        }
        
        $patient = Patient::create($request->all());
        
        
        $request->request->add([
            "patient_id" =>$patient->id
        ]);

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
        $patient = Patient::findOrFail($id);

        return response()->json([
            "patient" => PatientResource::make($patient),
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
        $patient_is_valid = Patient::where("id", "<>", $id)->where("pat_id", $request->pat_id)->first();
        
        $request->request->add(["pa_services"=>json_encode($request->services)]);

        if($patient_is_valid){
            return response()->json([
                "message"=>403,
                "message_text"=> 'el paciente ya existe'
            ]);
        }
        
        $patient = Patient::findOrFail($id);
        if($request->hasFile('imagen')){
            if($patient->avatar){
                Storage::delete($patient->avatar);
            }
            $path = Storage::putFile("patients", $request->file('imagen'));
            $request->request->add(["avatar"=>$path]);
        }
        
        if($request->birth_date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->birth_date );
            $request->request->add(["birth_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }

        if($request->pa_assessment_start_date){
            $date_clean1 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_assessment_start_date );
            $request->request->add(["pa_assessment_start_date" => Carbon::parse($date_clean1)->format('Y-m-d h:i:s')]);
        }

        if($request->pa_assessment_end_date){
            $date_clean2 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_assessment_end_date );
            $request->request->add(["pa_assessment_end_date" => Carbon::parse($date_clean2)->format('Y-m-d h:i:s')]);
        }
        
        if($request->pa_services_start_date){
            $date_clean3 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_services_start_date );
            $request->request->add(["pa_services_start_date" => Carbon::parse($date_clean3)->format('Y-m-d h:i:s')]);
        }
        
        if($request->pa_services_end_date){
            $date_clean4 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->pa_services_end_date );
            $request->request->add(["pa_services_end_date" => Carbon::parse($date_clean4)->format('Y-m-d h:i:s')]);
        }
        if($request->elegibility_date){
            $date_clean5 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->elegibility_date );
            $request->request->add(["elegibility_date" => Carbon::parse($date_clean5)->format('Y-m-d h:i:s')]);
        }
       
        $patient->update($request->all());
        
        error_log($patient);

        // if($patient->person){
        //     $patient->person->update($request->all());
        // }
        return response()->json([
            "message"=>200,
            "patient"=>$patient
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
        $patient = Patient::findOrFail($id);
        if($patient->avatar){
            Storage::delete($patient->avatar);
        }
        $patient->delete();
        return response()->json([
            "message"=>200
        ]);
    }

    public function updateEligibility(Request $request, $id)
    {
        $patient = Patient::findOrfail($id);
        $patient->eligibility = $request->eligibility;
        $patient->update();
        return $patient;
        
    }

}
