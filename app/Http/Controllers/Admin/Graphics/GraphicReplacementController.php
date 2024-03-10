<?php

namespace App\Http\Controllers\Admin\Graphics;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GraphicReplacementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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

    public function showGragphicSustitutionbyGoal(Request $request, string $goal)
    {
        $patient_is_valid = Patient::where("patient_id", '<>', $request->patient_id)->first();
        $sustitutiongoal = NoteRbt::where("goal", $goal)->orderBy("id", "desc")->get();
        return response()->json([
            "sustitutiongoal" => NoteRbtCollection::make($sustitutiongoal) ,
            // "replacements"=>json_decode($noteRbt-> replacements),
        ]);

        
    }
}
