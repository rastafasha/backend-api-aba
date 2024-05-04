<?php

namespace App\Http\Controllers\Admin\Doctor;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Bip\Bip;
use App\Models\Location;
use Illuminate\Http\Request;
use App\Models\Notes\NoteRbt;
use App\Models\Notes\NoteBcba;
use App\Models\Patient\Patient;
use App\Mail\NewUserRegisterMail;
use App\Models\Doctor\Specialitie;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Bip\BipCollection;
use App\Http\Resources\User\UserResource;
use App\Http\Resources\User\UserCollection;
use App\Http\Resources\Note\NoteRbtCollection;
use App\Http\Resources\Note\NoteBcbaCollection;
use App\Http\Resources\Patient\PatientCollection;
use App\Http\Resources\Location\LocationCollection;
use App\Http\Resources\Appointment\AppointmentCollection;

class DoctorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $search = $request->search;
        $users = User::where(DB::raw("CONCAT(users.name,' ',IFNULL(users.surname,''),' ',users.email)"),"like","%".$search."%")
                    // "name", "like", "%".$search."%"
                    // ->orWhere("surname", "like", "%".$search."%")
                    // ->orWhere("email", "like", "%".$search."%")
                    ->orderBy("id", "desc")
                    // ->whereHas("roles", function($q){
                    //     $q->where("name","like","%DOCTOR%");
                    // })
                    ->get();
                    
        return response()->json([
            "users" => UserCollection::make($users) ,
            
        ]);            
    }
    public function config()
    {
        
        $roles = Role::get();
        $locations = Location::get();
        return response()->json([
            "roles" => $roles,
            "locations" => $locations,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function profile($id)
    {
           
        $doctor = User::findOrFail($id);
        $patients = Patient::Where('rbt_home_id', $id)
                ->orWhere('rbt2_school_id', $id)
                ->orWhere('bcba_home_id', $id)
                ->orWhere('bcba2_school_id', $id)
                ->orWhere('clin_director_id', $id)
                ->get();
        $bips = Bip::Where('doctor_id', $id)->get();
        $notes_rbts = NoteRbt::Where('doctor_id', $id)->get();
        $notes_bcbas = NoteBcba::Where('doctor_id', $id)->get();
        $locations = Location::Where('id', $doctor->location_id)->get();

        return response()->json([
            "total_notes_bcbas" => $notes_bcbas->count(),
            "total_notes_rbts" => $notes_rbts->count(),
            "total_notes_bips" => $bips->count(),
            "total_locations" => $locations->count($doctor->locations),
            
            "doctor" => UserResource::make($doctor),
            "doctor"=> $doctor,
                    'doctor'=>[
                        'id'=> $doctor->id,
                        'location_id'=> $doctor->location_id,
                        // 'location_id'=> $doctor->count($location_id),
                        "locations" => LocationCollection::make($locations),
                        
                        // $request ->request->add(['who_is_it_for' => json_encode(explode(',', $request->who_is_it_for))]);
                        "name"=>$doctor->name,
                        "surname"=>$doctor->surname,
                        "full_name"=> $doctor->name.' '.$doctor->surname,
                        "email"=>$doctor->email,
                        "password"=>$doctor->password,
                        // "rolename"=>$doctor->rolename,
                        "phone"=>$doctor->phone,
                        "birth_date"=>$doctor->birth_date ? Carbon::parse($doctor->birth_date)->format("Y/m/d") : NULL,
                        "gender"=>$doctor->gender,
                        "address"=>$doctor->address,
                        "status"=>$doctor->status,
                        "avatar"=> $doctor->avatar ? env("APP_URL")."storage/".$doctor->avatar : null,
                        // "avatar"=> $doctor->avatar ? env("APP_URL").$doctor->avatar : null,
                        "roles"=>$doctor->roles->first(),
                        "currently_pay_through_company"=>$doctor->currently_pay_through_company,
                        "llc"=>$doctor->llc,
                        "ien"=>$doctor->ien,
                        "wc"=>$doctor->wc,
                        "electronic_signature"=>$doctor->electronic_signature ? env("APP_URL")."storage/".$doctor->electronic_signature : null,
                        // "electronic_signature"=>$doctor->electronic_signature ? env("APP_URL").$doctor->electronic_signature : null,
                        "agency_location"=>$doctor->agency_location,
                        "city"=>$doctor->city,
                        "languages"=>$doctor->languages,
                        "dob"=>$doctor->dob,
                        "ss_number"=>$doctor->ss_number,
                        "date_of_hire"=>$doctor->date_of_hire ? Carbon::parse($doctor->date_of_hire)->format("Y/m/d") : NULL,
                        "start_pay"=>$doctor->start_pay ? Carbon::parse($doctor->start_pay)->format("Y/m/d") : NULL,
                        "driver_license_expiration"=>$doctor->driver_license_expiration ? Carbon::parse($doctor->driver_license_expiration)->format("Y/m/d") : NULL,
                        "cpr_every_2_years"=>$doctor->cpr_every_2_years,
                        "background_every_5_years"=>$doctor->background_every_5_years,
                        "e_verify"=>$doctor->e_verify,
                        "national_sex_offender_registry"=>$doctor->national_sex_offender_registry,
                        "certificate_number"=>$doctor->certificate_number,
                        "bacb_license_expiration"=>$doctor->bacb_license_expiration ? Carbon::parse($doctor->bacb_license_expiration)->format("Y/m/d") : NULL,
                        "liability_insurance_annually"=>$doctor->liability_insurance_annually,
                        "local_police_rec_every_5_years"=>$doctor->local_police_rec_every_5_years,
                        "npi"=>$doctor->npi,
                        "medicaid_provider"=>$doctor->medicaid_provider,
                        
                        "ceu_hippa_annually"=>$doctor->ceu_hippa_annually,
                        "ceu_domestic_violence_no_expiration"=>$doctor->ceu_domestic_violence_no_expiration,
                        "ceu_security_awareness_annually"=>$doctor->ceu_security_awareness_annually,
                        "ceu_zero_tolerance_every_3_years"=>$doctor->ceu_zero_tolerance_every_3_years,
                        "ceu_hiv_bloodborne_pathogens_infection_control_no_expiration"=>$doctor->ceu_hiv_bloodborne_pathogens_infection_control_no_expiration,
                        "ceu_civil_rights_no_expiration"=>$doctor->ceu_civil_rights_no_expiration,
                        
                        "school_badge"=>$doctor->school_badge,
                        "w_9_w_4_form"=>$doctor->w_9_w_4_form,
                        "contract"=>$doctor->contract,
                        "two_four_week_notice_agreement"=>$doctor->two_four_week_notice_agreement,
                        "credentialing_package_bcbas_only"=>$doctor->credentialing_package_bcbas_only,
                        "caqh_bcbas_only"=>$doctor->caqh_bcbas_only,
                        "contract_type"=>$doctor->contract_type,
                        "salary"=>$doctor->salary,
                        
                    ],
            // "full_name" =>$doctor->full_name,
            "bips" => BipCollection::make($bips),
            "bips"=>$bips->map(function($bip){
                return[
                        "id"=> $bip->id,
                    "patient_id"=> $bip->patient_id,
                    "doctor_id"=> $bip->doctor_id,
                    "created_at"=> $bip->created_at->format('Y-m-d H:i'), 
                ];
            }),
            "notes_bcbas" => NoteBcbaCollection::make($notes_bcbas),
            "notes_bcbas"=>$notes_bcbas->map(function($notes_bcba){
                return[
                    "patient_id"=> $notes_bcba->patient_id,
                    "bip_id"=> $notes_bcba->bip_id,
                    "location"=> $notes_bcba->location,
                    "note_description"=> $notes_bcba->note_description,
                    "cpt_code"=> $notes_bcba->cpt_code,
                    "provider_name"=> $notes_bcba->provider_name,
                    'provider_name'=>[
                        'id'=> $notes_bcba->provider_name,
                        'name'=> $notes_bcba->tecnico->name,
                        'surname'=> $notes_bcba->tecnico->surname,
                        'npi'=> $notes_bcba->tecnico->npi,
                    ],
                    
                    "aba_supervisor"=> $notes_bcba->aba_supervisor,
                    'aba_supervisor'=>[
                        'id'=> $notes_bcba->aba_supervisor,
                        'name'=> $notes_bcba->supervisor->name,
                        'surname'=> $notes_bcba->supervisor->surname,
                        'npi'=> $notes_bcba->supervisor->npi,
                    ],
                    "created_at"=> $notes_bcba->created_at->format('Y-m-d H:i'),
                ];
            }),
            "notes_rbts" => NoteRbtCollection::make($notes_rbts),
            "notes_rbts"=>$notes_rbts->map(function($notes_rbt){
                return[
                    "patient_id"=> $notes_rbt->patient_id,
                    "bip_id"=> $notes_rbt->bip_id,
                    "provider_credential"=> $notes_rbt->provider_credential,
                    "session_date"=> $notes_rbt->session_date,
                    "next_session_is_scheduled_for"=> $notes_rbt->next_session_is_scheduled_for,
                    "time_in"=> $notes_rbt->time_in,
                    "time_out"=> $notes_rbt->time_out,
                    "time_in2"=> $notes_rbt->time_in2,
                    "time_out2"=> $notes_rbt->time_out2,
                    "billed"=> $notes_rbt->billed,
                    "maladaptives"=> $notes_rbt->maladaptives,
                    "replacements"=> $notes_rbt->replacements,
                    "pay"=> $notes_rbt->pay,
                    "meet_with_client_at"=> $notes_rbt->meet_with_client_at,
                    "total_hours"=> $notes_rbt->total_hours,
                    "supervisor_name"=> $notes_rbt->supervisor_name,
                    'supervisor'=>[
                        'id'=> $notes_rbt->supervisor_name,
                        'name'=> $notes_rbt->supervisor->name,
                        'surname'=> $notes_rbt->supervisor->surname,
                        'npi'=> $notes_rbt->supervisor->npi,
                    ],
                ];
            }),
            "patients" => PatientCollection::make($patients),
            "patients"=>$patients->map(function($patient){
                return[
                    "id"=> $patient->id,
                    "first_name"=> $patient->first_name,
                    "patient_id"=> $patient->patient_id,
                    "status"=> $patient->status,
                ];
            }),
            
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
        
        // if(!auth('api')->user()->can('create_doctor')){
        //     return response()->json(["message"=>"El usuario no esta autenticado"],403);
        //    }
        $schedule_hours = json_decode($request->schedule_hours,1);

        $user_is_valid = User::where("email", $request->email)->first();

        if($user_is_valid){
            return response()->json([
                "message"=>403,
                "message_text"=> 'el usuario con este email ya existe'
            ]);
        }

        if($request->hasFile('imagen')){
            $path = Storage::putFile("staffs", $request->file('imagen'));
            $request->request->add(["avatar"=>$path]);
        }

        if($request->hasFile('imagenn')){
            $path = Storage::putFile("signatures", $request->file('imagenn'));
            $request->request->add(["electronic_signature"=>$path]);
        }

        if($request->password){
            $request->request->add(["password"=>Hash::make($request->password)]);
        }

        if($request->birth_date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->birth_date );
            $request->request->add(["birth_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }

        if($request->date_of_hire){
            $date_clean1 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->date_of_hire );
            $request->request->add(["date_of_hire" => Carbon::parse($date_clean1)->format('Y-m-d h:i:s')]);
        }
        if($request->start_pay){
            $date_clean2 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->start_pay );
            $request->request->add(["start_pay" => Carbon::parse($date_clean2)->format('Y-m-d h:i:s')]);
        }
        if($request->bacb_license_expiration){
            $date_clean3 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->bacb_license_expiration );
            $request->request->add(["bacb_license_expiration" => Carbon::parse($date_clean3)->format('Y-m-d h:i:s')]);
        }
        if($request->driver_license_expiration){
            $date_clean4 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->driver_license_expiration );
            $request->request->add(["driver_license_expiration" => Carbon::parse($date_clean4)->format('Y-m-d h:i:s')]);
        }

        $user = User::create($request->all());
        $role=  Role::findOrFail($request->role_id);
        $user->assignRole($role);


        Mail::to($user->email)->send(new NewUserRegisterMail($user));

        return response()->json([
            "message" => 200,
            "user"=>$user
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
        
        // if(!auth('api')->user()->can('edit_doctor')){
        //     return response()->json(["message"=>"El usuario no esta autenticado"],403);
        //    }
        $user = User::findOrFail($id);

        return response()->json([
            "user" => UserResource::make($user),
        ]);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, string $id)
    {
        
        $user_is_valid = User::where("id", "<>", $id)->where("email", $request->email)->first();

        if($user_is_valid){
            return response()->json([
                "message"=>403,
                "message_text"=> 'el usuario con este email ya existe'
            ]);
        }
        
        $user = User::findOrFail($id);
        
       

        if($request->hasFile('imagen')){
            if($user->avatar){
                Storage::delete($user->avatar);
            }
            $path = Storage::putFile("staffs", $request->file('imagen'));
            $request->request->add(["avatar"=>$path]);
        }

        
        if($request->hasFile('imagenn')){
            if($user->electronic_signature){
                Storage::delete($user->electronic_signature);
            }
            $path = Storage::putFile("signatures", $request->file('imagenn'));
            $request->request->add(["electronic_signature"=>$path]);
        }
        
        if($request->password){
            $request->request->add(["password"=>Hash::make($request->password)]);
       }
        
        if($request->birth_date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->birth_date );
            $request->request->add(["birth_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }

        if($request->date_of_hire){
            $date_clean1 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->date_of_hire );
            $request->request->add(["date_of_hire" => Carbon::parse($date_clean1)->format('Y-m-d h:i:s')]);
        }
        if($request->start_pay){
            $date_clean2 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->start_pay );
            $request->request->add(["start_pay" => Carbon::parse($date_clean2)->format('Y-m-d h:i:s')]);
        }
        if($request->bacb_license_expiration){
            $date_clean3 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->bacb_license_expiration );
            $request->request->add(["bacb_license_expiration" => Carbon::parse($date_clean3)->format('Y-m-d h:i:s')]);
        }
        if($request->driver_license_expiration){
            $date_clean4 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->driver_license_expiration );
            $request->request->add(["driver_license_expiration" => Carbon::parse($date_clean4)->format('Y-m-d h:i:s')]);
        }
        $user->update($request->all());
        
        if($request->role_id && $request->role_id != $user->roles()->first()->id){
            // error_log($user->roles()->first()->id);
            $role_old = Role::findOrFail($user->roles()->first()->id);
            $user->removeRole($role_old);
            // error_log($request->role_id);
            $role_new = Role::findOrFail($request->role_id);
            $user->assignRole($role_new);
        }
        
        return response()->json([
            "message" => 200
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $id)
    {
        // if(!auth('api')->user()->can('delete_doctor')){
        //     return response()->json(["message"=>"El usuario no esta autenticado"],403);
        //    }
        $user = User::findOrFail($id);
        $user->delete();
        return response()->json([
            "message" => 200
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $user = User::findOrfail($id);
        $user->status = $request->status;
        $user->update();
        return $user;
        
    }
}
