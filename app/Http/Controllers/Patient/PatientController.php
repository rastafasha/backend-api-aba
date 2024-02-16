<?php

namespace App\Http\Controllers\Patient;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Location;
use App\Models\Bip\BipFile;
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
use App\Http\Resources\User\UserCollection;
use App\Http\Resources\Patient\PatientResource;
use App\Http\Resources\Location\LocationResource;
use App\Http\Resources\Patient\PatientCollection;
use App\Http\Resources\Insurance\InsuranceCollection;
use App\Http\Resources\Appointment\AppointmentCollection;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function index(Request $request)
    // {
    //     $search = $request->search;

    //     $patients = Patient::where(DB::raw("CONCAT(patients.first_name,' ', IFNULL(patients.last_name,''),' ',patients.email)"),
    //     "like","%".$search."%"
    //     )->orderBy("id", "desc")
    //     ->paginate(20);
                    
    //     return response()->json([
    //         "total" =>$patients->total(),
    //         "patients" => PatientCollection::make($patients),
            
    //     ]);          
    // }

    public function index(Request $request)
    {
        $patient_id = $request->patient_id;
        $name_patient = $request->search;
        $email_patient = $request->search;
        // $date = $request->date;

        $patients = Patient::filterAdvancePatient($patient_id, $name_patient, $email_patient)->orderBy("id", "desc")
                            ->paginate(10);
        return response()->json([
            // "total"=>$patients->total(),
            "patients"=> PatientCollection::make($patients)
        ]);

    }

    public function config()
    {
        // $patient= Patient::where("patient_id")->first();
        $specialists = User::where("status",'active')->get();
        // $roles = Role::where("name","like","%DOCTOR%")->get();

        $role_rbt= User::orderBy("id", "desc")
        ->whereHas("roles", function($q){
            $q->where("name","like","%RBT%");
        })
        ->get();
        $role_bcba= User::orderBy("id", "desc")
        ->whereHas("roles", function($q){
            $q->where("name","like","%BCBA%");
        })
        ->get();
        $role_admin= User::orderBy("id", "desc")
        ->whereHas("roles", function($q){
            $q->where("name","like","%ADMIN%");
        })
        ->get();
        $role_manager= User::orderBy("id", "desc")
        ->whereHas("roles", function($q){
            $q->where("name","like","%MANAGER%");
        })
        ->get();
        $role_superadmin= User::orderBy("id", "desc")
        ->whereHas("roles", function($q){
            $q->where("name","like","%SUPERADMIN%");
        })
        ->get();
        
        
        $insurances = Insurance::get();
        $locations = Location::get();
        
        // $documents = collect([]);

        // $patient_documents = BipFile::all();
        // foreach($patient_documents->groupBy("name") as $key => $patient_document){
        //     // dd($schedule_hour);
        //     $documents->push([
        //         "client_id" => $key,
        //         "name"=> $file->name,
        //         "size"=> $file->size,
        //         "file"=> $file->file,
        //         'file'=>$this->resource-> file->map(function($file){
        //             return [
        //                 'id'=> $file->id,
        //                 'client_id'=> $file->client_id,
        //                 'name_file'=> $file->name_file,
        //                 'size'=> $file->size,
        //                 'file'=> env("APP_URL")."storage/".$file->file,
        //                 'type'=> $file->type,
        //             ];
        //         })
        //     ]);

        // }
        
        return response()->json([
            "specialists" => $specialists,
            "insurances" => $insurances,
            // "insurances" => InsuranceCollection::make($insurances),//trae el json convertido para manipular
            "locations" => $locations,
            "roles_rbt" => $role_rbt,
            "roles_bcba" => $role_bcba,
            "roles_admin" => $role_admin,
            "roles_manager" => $role_manager,
            "roles_superadmin" => $role_superadmin,
            // "documents" => $documents,
            
        ]);
    }

   
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function profile($id)
    {
        
        $patient = Patient::findOrFail($id);
        $specialists = User::where("status",'active')->get();
        $insurances = Insurance::get();
        $locations = Location::get();


        return response()->json([
            "patient" => $patient,
            "specialists" => $specialists,
            "insurances" => $insurances,
            "locations" => $locations,
            "pa_assessments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : [],
            
            // "patient" => PatientResource::make($patient),
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
        $patient_is_valid = Patient::where("patient_id", $request->patient_id)->first();

        $request->request->add(["pa_assessments"=>json_encode($request->pa_assessments)]);
        // $request->request->add(["pa_services"=>json_encode($request->services)]);

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
        
        
        // $request->request->add([
        //     "client_id" =>$patient->id
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
        $patient = Patient::findOrFail($id);

        return response()->json([
            "patient" => $patient,
            // "pa_assessments"=>json_decode($patient-> pa_assessments),
            "pa_assessments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : [],
            // "patient" => PatientResource::make($patient),
            
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

        
        $patient_is_valid = Patient::where("id", "<>", $id)->first();
        
        // $request->request->add(["pa_services"=>json_encode($request->services)]);
        $request->request->add(["pa_assessments"=>json_encode($request->pa_assessments)]);

        
        
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
        
        // error_log($patient);

        // if($patient->person){
        //     $patient->person->update($request->all());
        // }
        return response()->json([
            "message"=>200,
            "patient"=>$patient,
            "pa_assessments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : [],
        ]);
    }

    public function patientUpdate(Request $request, Patient $patient)
    {
        

        try {
            DB::beginTransaction();

            $input = $this->userInput($patient);
            $request->request->add(["pa_services"=>json_encode($request->services)]);
            $request->request->add(["pa_assessments"=>json_encode($request->pa_assessments)]);
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
            $patient->update($request->all());;

            DB::commit();
            return response()->json([
                'code' => 200,
                'status' => 'Update user success',
                'user' => $user,
            ], 200);
        } catch (\Throwable $exception) {

            DB::rollBack();
            return response()->json([
                'message' => 'Error no update' . $exception,
            ], 500);
        }
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
        $patient->status = $request->status;
        $patient->update();
        return $patient;
        
    }

}