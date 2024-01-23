<?php

namespace App\Http\Controllers\Admin\Doctor;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Doctor\Specialitie;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\User\UserResource;
use App\Http\Resources\User\UserCollection;
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
                    ->whereHas("roles", function($q){
                        $q->where("name","like","%DOCTOR%");
                    })
                    ->get();
                    
        return response()->json([
            "users" => UserCollection::make($users) ,
            
        ]);            
    }
    public function config()
    {
        $roles = Role::where("name","like","%DOCTOR%")->get();
        return response()->json([
            "roles" => $roles,
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

        return response()->json([
            "doctor" => UserResource::make($doctor),
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

        if($request->password){
            $request->request->add(["password"=>Hash::make($request->password)]);
        }

        $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->birth_date );

        $request->request->add(["birth_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);

        $user = User::create($request->all());
        $role=  Role::findOrFail($request->role_id);
        $user->assignRole($role);


        // Mail::to($user->email)->send(new NewUserRegisterMail($user));

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
        
        if($request->password){
            $request->request->add(["password"=>bycript($request->password)]);
        }
        
        $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->birth_date );
        
        $request->request->add(["birth_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);

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
