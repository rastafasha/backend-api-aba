<?php

namespace App\Http\Controllers\Admin\Notes;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Notes\NoteRbt;
use App\Models\Patient\Patient;
use App\Models\Bip\ReductionGoal;
use App\Models\Notes\Maladaptive;
use App\Models\Notes\Replacement;
use App\Models\Bip\SustitutionGoal;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Note\NoteRbtResource;
use App\Http\Resources\Note\NoteRbtCollection;

class NoteRbtController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $note_rbts = NoteRbt::orderBy("id", "desc")
                            ->paginate(10);
        return response()->json([
            // "total"=>$patients->total(),
            "note_rbts"=> NoteRbtCollection::make($note_rbts)
        ]);
    }

    public function showByPatientId($patient_id)
    {
        $note_rbts = NoteRbt::where("patient_id", $patient_id)->get();
        $patient = Patient::where("patient_id", $patient_id)->first();
    
        return response()->json([
            // "note_rbts" => NoteRbtResource::make($note_rbts),
            "note_rbts" => NoteRbtCollection::make($note_rbts),
            // "note_rbts" => $note_rbts,
            // "patient" => $patient,
        ]);

        
    }

    public function config()
    {
        $hours =[
            [
                "id"=>"08",
                "name"=>"8:00 AM"
            ],
            [
                "id"=>"815",
                "name"=>"8:15 AM"
            ],
            [
                "id"=>"830",
                "name"=>"8:30 AM"
            ],
            [
                "id"=>"845",
                "name"=>"8:45 AM"
            ],
            [
                "id"=>"09",
                "name"=>"09:00 AM"
            ],
            [
                "id"=>"10",
                "name"=>"10:00 AM"
            ],
            [
                "id"=>"11",
                "name"=>"11:00 AM"
            ],
            [
                "id"=>"12",
                "name"=>"12:00 PM"
            ],
            [
                "id"=>"13",
                "name"=>"13:00 PM"
            ],
            [
                "id"=>"14",
                "name"=>"14:00 PM"
            ],
            [
                "id"=>"15",
                "name"=>"15:00 PM"
            ],
            [
                "id"=>"16",
                "name"=>"16:00 PM"
            ],
            [
                "id"=>"17",
                "name"=>"17:00 PM"
            ],
            [
                "id"=>"18",
                "name"=>"18:00 PM"
            ],
            [
                "id"=>"19",
                "name"=>"19:00 PM"
            ],
            [
                "id"=>"20",
                "name"=>"20:00 PM"
            ],
            [
                "id"=>"21",
                "name"=>"21:00 PM"
            ],
        ];
        $specialists = User::where("status",'active')->get();
        $maladaptives = ReductionGoal::get();
        $replacementGoals = SustitutionGoal::get();
        $replacements = Replacement::get();
        // $replacements = Replacement::get(["patient_id"]);

        $role_rbt= User::orderBy("id", "desc")
        ->whereHas("roles", function($q){
            $q->where("name","like","%RBT%");
        })->get();
        $role_bcba= User::orderBy("id", "desc")
        ->whereHas("roles", function($q){
            $q->where("name","like","%BCBA%");
        })->get();

        return response()->json([
            "specialists" => $specialists,
            "replacementGoals" => $replacementGoals,
            "replacements" => $replacements,
            "maladaptives" => $maladaptives,
            "hours" => $hours,
            "roles_rbt" => $role_rbt,
            "roles_bcba" => $role_bcba,
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
        $patient = null;
        $patient = Patient::where("patient_id", $request->patient_id)->first();
        $doctor = User::where("id", $request->doctor_id)->first();

        $request->request->add(["interventions"=>json_encode($request->interventions)]);
        $request->request->add(["maladaptive"=>json_encode($request->maladaptive)]);
        $request->request->add(["replacement"=>json_encode($request->replacement)]);

        if($request->hasFile('imagen')){
            $path = Storage::putFile("noterbts", $request->file('imagen'));
            $request->request->add(["provider_signature"=>$path]);
        }
        if($request->hasFile('imagenn')){
            $path = Storage::putFile("noterbts", $request->file('imagenn'));
            $request->request->add(["supervisor_signature"=>$path]);
        }

        if($request->session_date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->session_date );
            $request->request->add(["session_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }
        if($request->next_session_is_scheduled_for){
            $date_clean1 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->next_session_is_scheduled_for );
            $request->request->add(["next_session_is_scheduled_for" => Carbon::parse($date_clean1)->format('Y-m-d h:i:s')]);
        }

        // if($patient){
            
        //     Maladaptive::create([
        //         'patient_id' => $patient->patient_id,
        //         // 'doctor_id' => $doctor->id,
        //         "note_rbt_id" => $request-> note_rbt_id,
        //         "maladaptive" => $request-> maladaptive,
        //         "number_of_occurrences" => $request-> number_of_occurrences,
        //     ]);
        //     Replacement::create([
        //         'patient_id' => $patient->patient_id,
        //         // 'doctor_id' => $doctor->id,
        //         "note_rbt_id" => $request-> note_rbt_id,
        //         "replacement" => $request-> replacement,
        //         "total_trials" => $request-> total_trials,
        //         "number_of_correct_response" => $request-> number_of_correct_response,
        //     ]);
        // }else{
        //     $patient->replacement->update([
        //         "maladaptive" => $request-> maladaptive,
        //         "number_of_occurrences" => $request-> number_of_occurrences,
        //     ]);
        //     $patient->replacement->update([
        //         "replacement" => $request-> replacement,
        //         "total_trials" => $request-> total_trials,
        //         "number_of_correct_response" => $request-> number_of_correct_response,
        //     ]);
        // }

        
        
        $noteRbt = NoteRbt::create($request->all());
        // $noteRbt = NoteRbt::create([
        //     // "doctor_id" =>$request->doctor_id,
        //     "patient_id" =>$patient->patient_id,
        //     "session_date" => Carbon::parse($request->session_date)->format("Y-m-d h:i:s"),
        //     "next_session_is_scheduled_for" => Carbon::parse($request->next_session_is_scheduled_for)->format("Y-m-d h:i:s"),
        //     "doctor_id" => $request->user_id,
           
        //     // "user_id" => auth("api")->user()->id, aqui lo comente porque no reconoce el id.. 
        //     // asi que lo envio desde el front y aqui lo recibo
        //     // "amount" =>$request->amount,
        //     // "status_pay" =>$request->amount != $request->amount_add ? 2 : 1,
        // ]);

        
        
        // if($request->doctor_id){
        //     $doctor = User::findOrFail($id);

        //     return response()->json([
        //         "doctor"=>[
        //                 "id"=> $doctor->doctor_id,
        //                 "email"=> $doctor->email,
        //                 "full_name" =>$doctor->name.' '.$doctor->user->surname,
        //             ]
        //         ]);
        // }
            //envia un correo al doctor
        // Mail::to($appointment->patient->email)->send(new RegisterAppointment($appointment));
        // Mail::to($doctor->email)->send(new NewAppointmentRegisterMail($appointment));

        return response()->json([
            "message" => 200,
            "noteRbt" => $noteRbt,
            // "maladaptive" =>$request->maladaptive,
            // "maladaptive"=>$noteRbt->maladaptive ? 
            //         [
            //             // "id"=> $noteRbt->maladaptive->id,
            //             'patient_id' => $patient->id,
            //             'doctor_id' => $doctor->id,
            //             "note_rbt_id" => $request-> note_rbt_id,
            //             "maladaptive" => $request-> maladaptive,
            //             "number_of_occurrences" => $request-> number_of_occurrences,
            //         ]: NULL,
            // "replacement" =>$request->replacement,
            // "replacement"=>$noteRbt->replacement ? 
            //         [
            //             // "id"=> $noteRbt->replacement->id,
            //             'patient_id' => $patient->id,
            //             'doctor_id' => $doctor->id,
            //             "note_rbt_id" => $request-> note_rbt_id,
            //             "replacement" => $request-> replacement,
            //             "total_trials" => $request-> total_trials,
            //             "number_of_correct_response" => $request-> number_of_correct_response,
            //         ]: NULL,
            
            "session_date" => Carbon::parse($noteRbt->session_date)->format('d-m-Y'),
            "next_session_is_scheduled_for" => Carbon::parse($noteRbt->next_session_is_scheduled_for)->format('d-m-Y'),
            
            "interventions"=>json_decode($noteRbt-> interventions),
            "maladaptive"=>json_decode($noteRbt-> maladaptive),
            "replacement"=>json_decode($noteRbt-> replacement),
            "patient_id" => $noteRbt->patient_id,
            // "patient"=>$noteRbt->patient_id ? 
            //         [
            //             "id"=> $noteRbt->patient->id,
            //             "email" =>$noteRbt->patient->email,
            //             "full_name" =>$noteRbt->patient->name.' '.$noteRbt->patient->surname,
            //         ]: NULL,
            
            "doctor_id" => $noteRbt->doctor_id,
            // "doctor"=>$noteRbt->doctor_id ? 
            //             [
            //                 "id"=> $doctor->id,
            //                 "email"=> $doctor->email,
            //                 "full_name" =>$doctor->name.' '.$doctor->surname,
            //             ]: NULL,
            
                        "time_in" =>$noteRbt->time_in,
                        "time_out" =>$noteRbt->time_out,
                        "time_in2" =>$noteRbt->time_in2,
                        "time_out2" =>$noteRbt->time_out2,
                        "session_length_total" => $noteRbt->time_out - $noteRbt->time_in,
                        "session_length_total2" =>$noteRbt->time_out2 - $noteRbt->time_in2,

            "meet_with_client_at" =>$request->meet_with_client_at,
            "client_appeared" =>$request->client_appeared,
            "as_evidenced_by" =>$request->as_evidenced_by,
            "rbt_modeled_and_demonstrated_to_caregiver" =>$request->rbt_modeled_and_demonstrated_to_caregiver,
            "client_response_to_treatment_this_session" =>$request->client_response_to_treatment_this_session,
            "progress_noted_this_session_compared_to_previous_session" =>$request->progress_noted_this_session_compared_to_previous_session,
            "next_session_is_scheduled_for" =>$request->next_session_is_scheduled_for,
            "provider_signature" =>$request->provider_signature,
            "provider_name" =>$request->provider_name,
            "supervisor_signature" =>$request->supervisor_signature,
            "supervisor_name" =>$request->supervisor_name,
        ]);
    }


    public function storeReplacemts(Request $request)
    {
        $patient = null;
        $patient = Patient::where("patient_id", $request->patient_id)->first();
        $doctor = User::where("id", $request->doctor_id)->first();

       

        $replacement = Replacement::create($request->all());
        
        
        return response()->json([
            "message"=>200,
            "replacement"=>$replacement,
            "patient_id"=>$replacement->patient_id,
            "doctor_id" => $replacement->doctor_id,
            "doctor"=>$replacement->doctor_id ? 
                        [
                            "id"=> $doctor->id,
                            "email"=> $doctor->email,
                            "full_name" =>$doctor->name.' '.$doctor->surname,
                        ]: NULL,
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
        $noteRbt = NoteRbt::findOrFail($id);

        return response()->json([
            "noteRbt" => NoteRbtResource::make($noteRbt),
        ]);
    }
    public function showTimeworked($id)
    {
        $noteRbt = NoteRbt::findOrFail($id);
        $time_in = NoteRbt::where("time_in",$time_in);
        $time_out = NoteRbt::where("time_out",$time_out);

        $session_length_total = ($time_out - $time_in); 

        return response()->json([
            // "costo" => $costo,
            "session_length_total" => $session_length_total,
            "noteRbt" => NoteRbtResource::make($noteRbt),
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
        $noteRbt = NoteRbt::findOrFail($id);

        if($request->hasFile('imagen')){
            $path = Storage::putFile("noterbts", $request->file('imagen'));
            $request->request->add(["provider_signature"=>$path]);
        }
        if($request->hasFile('imagenn')){
            $path = Storage::putFile("noterbts", $request->file('imagenn'));
            $request->request->add(["supervisor_signature"=>$path]);
        }

        if($request->session_date){
            $date_clean = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->session_date );
            $request->request->add(["session_date" => Carbon::parse($date_clean)->format('Y-m-d h:i:s')]);
        }
        if($request->next_session_is_scheduled_for){
            $date_clean1 = preg_replace('/\(.*\)|[A-Z]{3}-\d{4}/', '',$request->next_session_is_scheduled_for );
            $request->request->add(["next_session_is_scheduled_for" => Carbon::parse($date_clean1)->format('Y-m-d h:i:s')]);
        }

        // if($noteRbt->payments->sum("amount") > $request->amount){
        //     return response()->json([
        //         "message" => 403,
        //         "message_text"=> "Los Pagos ingresados superan al nuevo monto que quiere guardar"
        //     ]);
        // }

        $noteRbt->update([
            "doctor_id" =>$request->doctor_id,
            "patient_id" =>$request->patient_id,
            // "date_appointment" => Carbon::parse($request->date_appointment)->format("Y-m-d h:i:s"),
            // "speciality_id" => $request->speciality_id,
            // "doctor_schedule_join_hour_id" => $request->doctor_schedule_join_hour_id,
            // "amount" =>$request->amount,
            // "status_pay" =>$appointment->payments->sum("amount") != $request->amount ? 2 : 1,

            "maladaptive"=>$noteRbt->maladaptive ? 
                    [
                        "id"=> $noteRbt->maladaptive->id,
                        'patient_id' => $patient->id,
                        'doctor_id' => $doctor->id,
                        "note_rbt_id" => $request-> note_rbt_id,
                        "maladaptive" => $request-> maladaptive,
                        "number_of_occurrences" => $request-> number_of_occurrences,
                    ]: NULL,
            // "replacement" =>$request->replacement,
            "replacement"=>$noteRbt->replacement ? 
                    [
                        "id"=> $noteRbt->replacement->id,
                        'patient_id' => $patient->id,
                        'doctor_id' => $doctor->id,
                        "note_rbt_id" => $request-> note_rbt_id,
                        "replacement" => $request-> replacement,
                        "total_trials" => $request-> total_trials,
                        "number_of_correct_response" => $request-> number_of_correct_response,
                    ]: NULL,
            
            "session_date" => Carbon::parse($noteRbt->session_date)->format('d-m-Y'),
            "next_session_is_scheduled_for" => Carbon::parse($noteRbt->next_session_is_scheduled_for)->format('d-m-Y'),
            
            "interventions"=>json_decode($noteRbt-> interventions),
            
            "patient"=>$noteRbt->patient_id ? 
                    [
                        "id"=> $noteRbt->patient->id,
                        "email" =>$noteRbt->patient->email,
                        "full_name" =>$noteRbt->patient->name.' '.$noteRbt->patient->surname,
                    ]: NULL,
            
            "doctor_id" => $noteRbt->doctor_id,
            "doctor"=>$noteRbt->doctor_id ? 
                        [
                            "id"=> $doctor->id,
                            "email"=> $doctor->email,
                            "full_name" =>$doctor->name.' '.$doctor->surname,
                        ]: NULL,

            "meet_with_client_at" =>$request->meet_with_client_at,
            "client_appeared" =>$request->client_appeared,
            "as_evidenced_by" =>$request->as_evidenced_by,
            "rbt_modeled_and_demonstrated_to_caregiver" =>$request->rbt_modeled_and_demonstrated_to_caregiver,
            "client_response_to_treatment_this_session" =>$request->client_response_to_treatment_this_session,
            "progress_noted_this_session_compared_to_previous_session" =>$request->progress_noted_this_session_compared_to_previous_session,
            "next_session_is_scheduled_for" =>$request->next_session_is_scheduled_for,
            "provider_signature" =>$request->provider_signature,
            "provider_name" =>$request->provider_name,
            "supervisor_signature" =>$request->supervisor_signature,
            "supervisor_name" =>$request->supervisor_name,
        ]);

        return response()->json([
            "message" => 200,
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
        $noteRbt = NoteRbt::findOrFail($id);
        $noteRbt->delete();
        return response()->json([
            "message" => 200,
        ]);
    }

    public function atendidas()
    {
        
        $noteRbts = NoteRbt::where('status', 2)->orderBy("id", "desc")
                            ->paginate(10);
        return response()->json([
            "total"=>$noteRbts->total(),
            "noteRbts"=> NoteRbtCollection::make($apponoteRbtsintments)
        ]);

    }
}
