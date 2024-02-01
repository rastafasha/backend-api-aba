<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Location;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Location\LocationResource;
use App\Http\Resources\Location\LocationCollection;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $client_id = $request->client_id;
        $name_client = $request->search;
        $email_client = $request->search;
        $doctor_id = $request->doctor_id;
        $name_doctor = $request->search;
        $email_doctor = $request->search;

        $locations = Location::filterAdvanceLocation(
            $client_id, $name_client, $email_client,
            $doctor_id, $name_doctor, $email_doctor,
            )->orderBy("id", "desc")
                            ->paginate(10);
        return response()->json([
            // "total"=>$patients->total(),
            "locations"=> LocationCollection::make($locations)
        ]);

    }

    public function config()
    {
        // $roles = Role::where("name","like","%DOCTOR%")->get();
        $specialists = User::where("status",'active')->get();
        $insurances = Location::get();
        
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
            // "documents" => $documents,
            
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
        $user_is_valid = User::where("email", $request->email)->first();


        if($user_is_valid){
            return response()->json([
                "message"=>403,
                "message_text"=> 'el usuario con este email ya existe'
            ]);
        }

        if($request->hasFile('imagen')){
            $path = Storage::putFile("locations", $request->file('imagen'));
            $request->request->add(["avatar"=>$path]);
        }

        
        
        $location = Location::create($request->all());
        
        
        return response()->json([
            "message"=>200,
            // "location" => LocationCollection::make($location),
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
        $location = Location::findOrFail($id);

        return response()->json([
            "location" => LocationResource::make($location),
            // "assesstments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : [],
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

        
        $user_is_valid = User::where("email", $request->email)->first();


        // if($user_is_valid){
        //     return response()->json([
        //         "message"=>403,
        //         "message_text"=> 'el usuario con este email ya existe'
        //     ]);
        // }
        
        $request->request->add(["pa_services"=>json_encode($request->services)]);
        $request->request->add(["pa_assessments"=>json_encode($request->pa_assessments)]);

        
        
        $location = Location::findOrFail($id);

        if($request->hasFile('imagen')){
            if($location->avatar){
                Storage::delete($location->avatar);
            }
            $path = Storage::putFile("locations", $request->file('imagen'));
            $request->request->add(["avatar"=>$path]);
        }
        
        
       
        $location->update($request->all());
        
        
        return response()->json([
            "message"=>200,
            "location"=>$location,
            // "assesstments"=>$patient->pa_assessments ? json_decode($patient->pa_assessments) : [],
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
        $location = Location::findOrFail($id);
        if($location->avatar){
            Storage::delete($location->avatar);
        }
        $location->delete();
        return response()->json([
            "message"=>200
        ]);
    }
}
