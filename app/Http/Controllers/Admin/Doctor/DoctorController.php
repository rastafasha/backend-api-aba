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
use App\Http\Resources\Patient\PatientCollection;
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
        $patients = Patient::Where('rbt_id', $id)
                ->orWhere('rbt2_id', $id)
                ->orWhere('bcba_id', $id)
                ->orWhere('bcba2_id', $id)
                ->orWhere('clin_director_id', $id)
                ->get();
        $bips = Bip::Where('doctor_id', $id)->get();
        $notes_rbts = NoteRbt::Where('doctor_id', $id)->get();
        $notes_bcbas = NoteBcba::Where('doctor_id', $id)->get();

        return response()->json([
            "total_notes_bcbas" => $notes_bcbas->count(),
            "total_notes_rbts" => $notes_rbts->count(),
            "total_notes_bips" => $bips->count(),
            "doctor" => UserResource::make($doctor),
            // "full_name" =>$doctor->full_name,
            "bips" => BipCollection::make($bips),
            "bips"=>$bips->map(function($bip){
                return[
                        "id"=> $bip->id,
                    "patient_id"=> $bip->patient_id,
                    "doctor_id"=> $bip->doctor_id,
                    "created_at"=> $bip->created_at,
                ];
            }),
            "notes_bcbas" => NoteRbtCollection::make($notes_bcbas),
            "notes_bcbas"=>$notes_bcbas->map(function($notes_bcba){
                return[
                    "patient_id"=> $notes_bcba->patient_id,
                    "bip_id"=> $notes_bcba->bip_id,
                    "session_date"=> $notes_bcba->session_date,
                ];
            }),
            "notes_rbts" => NoteRbtCollection::make($notes_rbts),
            "notes_rbts"=>$notes_rbts->map(function($notes_rbt){
                return[
                    "patient_id"=> $notes_rbt->patient_id,
                    "bip_id"=> $notes_rbt->bip_id,
                    "provider_credential"=> $notes_rbt->provider_credential,
                    "session_date"=> $notes_rbt->session_date,
                    "time_in"=> $notes_rbt->time_in,
                    "time_out"=> $notes_rbt->time_out,
                    "time_in2"=> $notes_rbt->time_in2,
                    "time_out2"=> $notes_rbt->time_out2,
                    "billed"=> $notes_rbt->billed,
                    "pay"=> $notes_rbt->pay,
                ];
            }),
            "patients" => PatientCollection::make($patients),
            "patients"=>$patients->map(function($patient){
                return[
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
