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

class NoteRbtController extends Controller
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

    public function showByPatientId($patient_id)
    {
        $note_rbts = NoteRbt::where("patient_id", $patient_id)->first();
        $patient = Patient::where("patient_id", $patient_id)->first();
    
        return response()->json([
            "note_rbts" => NoteRbtResource::make($note_rbts),
            "patient" => $patient,
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
                "name"=>"01:00 PM"
            ],
            [
                "id"=>"14",
                "name"=>"02:00 PM"
            ],
            [
                "id"=>"15",
                "name"=>"03:00 PM"
            ],
            [
                "id"=>"16",
                "name"=>"04:00 PM"
            ],
            [
                "id"=>"17",
                "name"=>"05:00 PM"
            ],
            [
                "id"=>"18",
                "name"=>"06:00 PM"
            ],
            [
                "id"=>"19",
                "name"=>"07:00 PM"
            ],
            [
                "id"=>"20",
                "name"=>"08:00 PM"
            ],
            [
                "id"=>"21",
                "name"=>"09:00 PM"
            ],
        ];
        $specialists = User::where("status",'active')->get();
        $maladaptives = ReductionGoal::get();
        $replacementGoals = SustitutionGoal::get();

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
        // $doctor = User::where("doctor_id", $request->doctor_id)->first();

        $request->request->add(["interventions"=>json_encode($request->interventions)]);

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

        if($patient){
            
            Maladaptive::create([
                'patient_id' => $patient->id,
                // 'doctor_id' => $doctor->id,
                "note_rbt_id" => $request-> note_rbt_id,
                "maladaptive" => $request-> maladaptive,
                "number_of_occurrences" => $request-> number_of_occurrences,
            ]);
            Replacement::create([
                'patient_id' => $patient->id,
                // 'doctor_id' => $doctor->id,
                "replacement" => $request-> replacement,
                "total_trials" => $request-> total_trials,
                "number_of_correct_response" => $request-> number_of_correct_response,
            ]);
        }else{
            $patient->replacement->update([
                "maladaptive" => $request-> maladaptive,
                "number_of_occurrences" => $request-> number_of_occurrences,
            ]);
            $patient->replacement->update([
                "replacement" => $request-> replacement,
                "total_trials" => $request-> total_trials,
                "number_of_correct_response" => $request-> number_of_correct_response,
            ]);
        }

        
        // $user = auth('api')->user();//lo coloco para saber si viene o no
        // error_log($doctor);

        $noteRbt = NoteRbt::create([
            // "doctor_id" =>$request->doctor_id,
            "patient_id" =>$patient->patient_id,
            "session_date" => Carbon::parse($request->session_date)->format("Y-m-d h:i:s"),
            "next_session_is_scheduled_for" => Carbon::parse($request->next_session_is_scheduled_for)->format("Y-m-d h:i:s"),
            "doctor_id" => $request->user_id,
           
            // "user_id" => auth("api")->user()->id, aqui lo comente porque no reconoce el id.. 
            // asi que lo envio desde el front y aqui lo recibo
            // "amount" =>$request->amount,
            // "status_pay" =>$request->amount != $request->amount_add ? 2 : 1,
        ]);

        
        
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
        // $sum_total_pays = AppointmentPay::where("appointment_id",$id)->sum("amount");
        // $costo = $appointment->amount;
        // $deuda = ($costo - $sum_total_pays); 

        return response()->json([
            // "costo" => $costo,
            // "deuda" => $deuda,
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
