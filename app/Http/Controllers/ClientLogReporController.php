<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Location;
use Illuminate\Http\Request;
use App\Models\Patient\Patient;
use App\Models\Insurance\Insurance;
use App\Http\Resources\User\UserCollection;
use App\Http\Resources\Patient\PatientResource;
use App\Http\Resources\Patient\PatientCollection;
use App\Http\Resources\Location\LocationCollection;
use App\Http\Resources\Insurance\InsuranceCollection;

class ClientLogReporController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         
        $specialists = User::where("status",'active')->get();

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
        $patients = Patient::orderBy('id', 'desc')->get();
        
        
        return response()->json([
            "patients" => PatientCollection::make($patients),
            
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
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
