<?php

namespace App\Http\Controllers\Admin\Graphics;

use DateTime;
use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Notes\NoteRbt;
use App\Models\Patient\Patient;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Resources\Note\NoteRbtResource;
use App\Http\Resources\Note\NoteRbtCollection;

class GraphicReductionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function config(){
        $users= User::orderBy("id", "desc")
        // ->whereHas("roles", function($q){
        //     $q->where("name","like","%DOCTOR%");
        // })
        ->get();

        return response()->json([
            "doctors"=>$users->map(function($user){
                return[
                    "id"=> $user->id,
                    "full_name"=> $user->name.' '.$user->surname,
                ];
            })
        ]);
    }
    


    public function configPatients(){
        $patients= Patient::orderBy("id", "desc")->get();

        return response()->json([
            "patients"=>$patients->map(function($patients){
                return[
                    "id"=> $patients->id,
                    "full_name"=> $patients->first_name.' '.$patients->last_name,
                ];
            })
        ]);
    }

    public function show($id)
    {
        $noteRbt = NoteRbt::findOrFail($id);
        $doctor = User::where("status",'active')->get();

        return response()->json([
            // "noteRbt" => NoteRbtResource::make($noteRbt),
            "session_date" => $noteRbt->session_date,
            "interventions"=>json_decode($noteRbt-> interventions),
            "maladaptives"=>json_decode($noteRbt-> maladaptives),
            "replacements"=>json_decode($noteRbt-> replacements),

            
            // "maladaptives"=>json_decode($noteRbt-> maladaptives),
            
            
            
        ]);
    }


    public function showbyPatientId(Request $request, $patient_id)
    {

        $noteRbt = NoteRbt::where("patient_id", $request->patient_id)->get();
        
    
        return response()->json([
            // "id"=>$noteRbt->id,
            // "noteRbt" => $noteRbt,
            "noteRbt" => NoteRbtCollection::make($noteRbt),
            // "bip" => BipResource::make($bip),
            // "session_date" =>$noteRbt->session_date,
            // "maladaptives"=>json_decode($noteRbt-> maladaptives),
            // "replacements"=>json_decode($noteRbt-> replacements),
            
            
        ]);
    }

    public function showPatientId($patient_id)
    {
        $patient = Patient::where("patient_id", $patient_id)->first();
        
    
        return response()->json([
            "patient" => $patient,
            
            
        ]);

        
    }

    

    public function showGragphicbyMaladaptive(Request $request, string $maladaptives, $patient_id)
{
    // Check if the patient exists
        $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();

        // Retrieve all NoteRbt records that match the given maladaptive behavior type and patient ID
        $noteRbt = NoteRbt::where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
            ->where("patient_id", $request->patient_id)
            ->get();
        
        
        // Retrieve all unique session dates from the NoteRbt records
        $sessions = NoteRbt::pluck('session_date'); // trae toda las fechas

        //trae la primera y ultima fecha de la semana
        $week_session = NoteRbt::whereNotNull('session_date')->get();

            if ($week_session->isNotEmpty()) {
                $first_date = $week_session->first()->week_session;
                $last_date = $week_session->last()->week_session;

                // Convert the first and last date to Carbon instances
                $first_date = Carbon::parse($first_date);
                $last_date = Carbon::parse($last_date);

                // Get the first and last date of the week
                $first_date_of_week = $first_date->startOfWeek();
                $last_date_of_week = $last_date->endOfWeek();

            } 
            
            //los trae null cuando hay informacion en la respuesta
            // $noteRbt = NoteRbt::selectRaw('JSON_EXTRACT(maladaptives, "$.maladaptive_behavior") 
            // as maladaptive_behavior, JSON_EXTRACT(maladaptives, "$.number_of_occurrences") as number_of_occurrences')
            //         ->where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
            //         ->where("patient_id", $patient_id)
            //         ->get();
        
        // Initialize an empty collection to store the number of occurrences of the given maladaptive behavior type
        // funcionan los 3
        // $maladaptivesCollection = new Collection();
        $maladaptivesCollection = collect();

        // Get the name of the maladaptive behavior type from the request
        $maladaptive_behavior = $maladaptives;

        
        // Initialize an empty array to store the JSON strings
        $json_strings = [];

        foreach ($noteRbt as $item) {
            // Log::debug("Processing item: " . $item);
            
            $maladaptivesCollection->push($item->maladaptives); 
            Log::debug("maladaptivesCollection: " . $maladaptivesCollection);
            
            $json_string = str_replace(['[{\"\\\"[', '\\\\\\"',  ']\\\"\"],'], ['[', '\"',  '"]'], $maladaptives);
            Log::debug("Cleaned JSON string: " . $json_string);

            if (json_validate($json_string)) {
                $maladaptives = json_decode($json_string, false, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
                if (json_last_error() === JSON_ERROR_NONE && is_array($maladaptives)) {
                    $number_of_occurrences = 0;
                    foreach ($maladaptives as $maladaptive) {
                        $number_of_occurrences += $maladaptive->number_of_occurrences;
                    }
                    $maladaptivesCollection->push($number_of_occurrences);
                } else {
                    // Log::debug("Failed to decode JSON: " . json_last_error_msg());
                }
            } else {
                // Log::debug("Invalid JSON string: " . $json_string);
            }

        }

        // Log::debug("JSON strings: " . json_encode($json_strings, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

        $result = '[' . implode(',', $json_strings) . ']';
        // Log::debug("Result: " . $result);
        
        
        // Convert maladaptives from string to JSON array
        $maladaptives = json_decode($item->maladaptives, true);
        Log::debug("maladaptives: " . $maladaptives);
        
        // Define the value you want to filter by
        $filter_value = $maladaptive_behavior;
        Log::debug("filter_value: " . $filter_value);

        // Filter the maladaptives array
        // $filtered_maladaptives = array_filter($maladaptives, function ($maladaptive) use ($filter_value) {
        //     return $maladaptive['maladaptive_behavior'] == $filter_value;
        // });


        //calcular la semana
        function getWeekNumber($session_date) {
            $d = new DateTime($session_date);
            return $d->format("W");
        }

        return response()->json([
            
        'maladaptive_behavior' => $maladaptive_behavior, // trae el nombre  del comportamiento que se busco
        // 'notes_rbt_count'=> count($maladaptivesCollection),     //cuenta los elementos en maladapt   
        // 'maladaptives' => $maladaptivesCollection.str_replace(['["\"\"\\\"', '\\\\\\"', '"]'], ['', '\"', ''], $item->maladaptives),// limpia el resultado ?
        // 'maladaptives' => $maladaptivesCollection, 
        'maladaptives' => $maladaptives, 
        // 'filtered_maladaptives' => $filtered_maladaptives, 

        
        
        
        // 'sessions_dates' => $sessions, 
        // 'First date of the week' => $first_date_of_week->format('Y-m-d'), 
        // 'Last date of the week' => $last_date_of_week->format('Y-m-d'), 
        // 'Week number' => getWeekNumber($request->fecha),
        // 'total_number_of_occurrences' => $number_of_occurrences,
        
        // 'maladaptives' => $json_string,// los devuelve de nuevo con basura
        // 'noteRbt' => $noteRbt, // trae todas las notas

        
         
    ], 201);

    

    if ($maladaptivesCollection->isEmpty()) {
        // Return a 404 Not Found response if the $maladaptivesCollection is empty
        return response()->json(['error' => 'No data found for maladaptive behavior: '.$maladaptives], 404);
    }

    // return response()->json($response, 201);
}

//los trae separado pero vacio
// public function showGragphicbyMaladaptive(Request $request, string $maladaptives, $patient_id)
// {
//     $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();

//     if (!$patient_is_valid) {
//         // Return a 404 Not Found response if the patient is not valid
//         return response()->json(['error' => 'Patient not found'], 404);
//     }

//     $noteRbt = NoteRbt::where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
//         ->where("patient_id", $patient_id)
//         ->get();

//     $maladaptivesCollection = new Collection();

//     $maladaptivesCollection = $noteRbt->map(function ($maladaptives) {
//         $json = json_encode($maladaptives);
//         if (json_last_error() === JSON_ERROR_NONE) {
//             $decoded = json_decode($json, false, 512, JSON_UNESCAPED_SLASHES);
//             if (is_object($decoded) && isset($decoded->$maladaptives)) {
//                 return [
//                     "dataInterna" => json_encode($decoded),
//                     "dataInternaDetails" => [
//                         [
//                             'maladaptive_behavior' => $decoded->$maladaptives,
//                             'number_of_occurrences' => $decoded->number_of_occurrences,
//                         ]
//                     ]
//                 ];
//             } else {
//                 // Log an error message if $decoded is not an object or does not have the $maladaptives property
//                 Log::error("Decoded object is not an object or does not have the $maladaptives property: " . json_encode($decoded));
//                 return [];
//             }
//         } else {
//             // Log an error message if $maladaptive is not a valid JSON string
//             Log::error("$maladaptive is not a valid JSON string: " . json_last_error_msg());
//             return [];
//         }
//     });

//     $grouped = $maladaptivesCollection;

//     return response()->json([
//         'maladaptive_behavior' => $maladaptives,
//         "maladaptives" => $grouped
//     ], 200);
// }

//los trae separado pero vacio con data interna
// public function showGragphicbyMaladaptive(Request $request, string $maladaptives, $patient_id)
// {
//     $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();
//     $noteRbt = NoteRbt::where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
//         ->where("patient_id", $patient_id)
//         ->get();

//         $maladaptivesCollection = new Collection();
//         $maladaptive_behavior = $maladaptives;

//         foreach ($noteRbt as $item) {
//                     $maladaptivesCollection->push($item->maladaptives);
                    
//                 }

//     return response()->json([
//         "maladaptives" => $maladaptivesCollection->map(function ($maladaptives) {
//             $decoded = json_decode($maladaptives);
//             return [
//                 "dataInterna" => is_object($decoded) ? $decoded : (object) [],
//                 "dataInternaDetails" => is_object($decoded) ? [
//                     [
//                         'maladaptive_behavior' => $decoded->maladaptive_behavior,
//                         'number_of_occurrences' => $decoded->number_of_occurrences,
//                     ]
//                 ] : [],
//             ];
//         })->groupBy("session_date")->toArray()
//     ], 201);
// }


// public function showGragphicbyMaladaptive(Request $request, string $maladaptives, $patient_id)
// {
//     $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();

//     if (!$patient_is_valid) {
//         return response()->json(['error' => 'Patient not found'], 404);
//     }

//     $noteRbt = NoteRbt::where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
//         ->where("patient_id", $patient_id)
//         ->get(); //lo devuelve asi:
//     //     // maladaptives": "[\"\\\"[
//     //     // {
//     //     //     \\\\\\\"maladaptive_behavior\\\\\\\": \\\\\\\"Negative Self talk\\\\\\\",
//     //     //     \\\\\\\"number_of_occurrences\\\\\\\": 30
//     //     //   },{
//     //     //     \\\\\\\"maladaptive_behavior\\\\\\\": \\\\\\\"otro\\\\\\\",
//     //     //     \\\\\\\"number_of_occurrences\\\\\\\": 23
//     //     //   }
    
//     // requiero traer solo el number_of_occurrences por el  maladaptive_behavior de cada noteRbt  ?
//     // requiero la suma de number_of_occurrences de el maladaptives maladaptive_behavior de cada noteRbt por semana  ?
        


//     $noteRbt = NoteRbt::selectRaw('JSON_EXTRACT(maladaptives, "$.maladaptive_behavior") as maladaptive_behavior, JSON_EXTRACT(maladaptives, "$.number_of_occurrences") as number_of_occurrences')
//         ->where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
//         ->where("patient_id", $patient_id)
//         ->get();
//         // los devuelve perfecto pero con valor null

//         // requiero eliminar  los "[\"\\\"[ y los \\\\\\\ \ para que quede como un array de objetos JSON
//         // ademas traer solo el number_of_occurrences por el  maladaptive_behavior que se llamen igual a $maladatives de cada noteRbt  
        


//     $maladaptivesCollection = new Collection();

//     foreach ($noteRbt as $item) {
//         $maladaptivesCollection->push($item->maladaptives);
//     }

//     $result = [];

//     foreach ($maladaptivesCollection as $item) {
//         $decoded = json_decode($item, false, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
//         if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
//             $result[] = [
//                 'maladaptive_behavior' => $decoded['maladaptive_behavior'],
//                 'number_of_occurrences' => $decoded['number_of_occurrences'],
//             ];
//         }
//     }

//     $json_encoded = json_encode($maladaptivesCollection, false, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);

//     return response()->json([
//         'maladaptive_behavior' => $maladaptives,
//         "maladaptives" => $json_encoded,
//         "result" => $result
//     ], 201);
// }

//trae el $json_string = str_replace(['[\"\\"', '\\\\\\"', '"]'],
// public function showGragphicbyMaladaptive(Request $request, string $maladaptives, $patient_id)
// {
//     $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();

//     if (!$patient_is_valid) {
//         return response()->json(['error' => 'Patient not found'], 404);
//     }

//     $noteRbt = NoteRbt::where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
//         ->where("patient_id", $patient_id)
//         ->get();

//     $maladaptivesCollection = new Collection();

//     foreach ($noteRbt as $item) {
//         $json_string = str_replace(['[\"\\"', '\\\\\\"', '"]'], ['', '\"', ''], $item->maladaptives);
//         $decoded = json_decode($json_string, false, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
//         if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
//             $maladaptivesCollection->push($decoded);
//         }
//     }

//     $result = [];

//     foreach ($maladaptivesCollection as $item) {
//         if ($item->maladaptive_behavior == $maladaptives) {
//             $result[] = [
//                 'maladaptive_behavior' => $item->maladaptive_behavior,
//                 'number_of_occurrences' => $item->number_of_occurrences,
//             ];
//         }
//     }

//     $json_encoded = json_encode($result, false, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);

//     return response()->json([
//         'maladaptives' => $json_encoded,
//     ], 201);
// }

//calcular la semana
function getWeekNumber($session_date) {
    $d = new DateTime($session_date);
    return $d->format("W");
}

// public function showGragphicbyMaladaptive(Request $request, string $maladaptives, $patient_id)
// {
//     $patient_is_valid = NoteRbt::where("patient_id", $patient_id)->first();

//     if (!$patient_is_valid) {
//         return response()->json(['error' => 'Patient not found'], 404);
//     }

//     $noteRbt = NoteRbt::selectRaw('JSON_EXTRACT(maladaptives, "$.maladaptive_behavior") as maladaptive_behavior, JSON_EXTRACT(maladaptives, "$.number_of_occurrences") as number_of_occurrences')
//         ->where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
//         ->where("patient_id", $patient_id)
//         ->get();

//     $result = [];

//     foreach ($noteRbt as $item) {
//         $decoded = json_decode($item->maladaptive_behavior, true);
//         if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
//             $result[] = [
//                 'maladaptive_behavior' => $decoded['maladaptive_behavior'],
//                 'number_of_occurrences' => $item->number_of_occurrences,
//             ];
//         }
//     }

//     $json_encoded = json_encode($result, JSON_UNESCAPED_SLASHES);

//     return response()->json([
//         'maladaptive_behavior' => $maladaptives,
//         "maladaptives" => $json_encoded,
//         "result" => $result
//     ], 201);
// }


// public function showGragphicbyMaladaptive(Request $request, string $maladaptives, $patient_id)
// {
//     $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();

//     if (!$patient_is_valid) {
//         return response()->json(['error' => 'Patient not found'], 404);
//     }

//     $noteRbt = NoteRbt::where('maladaptives', 'LIKE', '%'.$maladaptives.'%')
//         ->where("patient_id", $patient_id)
//         ->get();

//     $result = [];

//     foreach ($noteRbt as $item) {
//         $decoded = json_decode($item->maladaptives, false, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
//         if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
//             foreach ($decoded as $behavior) {
//                 $maladaptive_behavior = $behavior->maladaptive_behavior;
//                 $number_of_occurrences = $behavior->number_of_occurrences;

//                 if (!isset($result[$maladaptive_behavior])) {
//                     $result[$maladaptive_behavior] = 0;
//                 }

//                 $result[$maladaptive_behavior] += $number_of_occurrences;
//             }
//         }
//     }

    

//     return response()->json([
//         'maladaptive_behavior' => $maladaptives,
//         "result" => $result
//     ], 201);
// }



    public function showGragphicbyReplacement(Request $request, string $replacements ,$patient_id)
    {
        $patient_is_valid = NoteRbt::where("patient_id", $request->patient_id)->first();

        $noteRbt = NoteRbt::where('replacements', 'LIKE', '%'.$replacements.'%')
        ->where("patient_id", $request->patient_id)->get();

        $replacementsCollection = new Collection();

        foreach ($noteRbt as $item) {
            $replacementsCollection->push($item->replacements);
        }
        
        return response()->json([
            // "noteRbt" => $noteRbt,
            
            "noteRbt" => NoteRbtCollection::make($noteRbt) ,
            // "session_date" =>$noteRbt->session_date,
            "replacements" => $replacementsCollection->map(function ($replacem) {
                // return $maladaptive;
                return json_decode($replacem);
                foreach ($replacem as $replac){
                    DB::table('note_rbts')->where('replacements','=', $request->replac->goal)->get();
                }
            })->groupBy("session_date")->toArray()
            
        ],201);



        
    }


    public function graphic_patient_month(Request $request){

        $month = $request->month;
        $patient_id = $request->patient_id;

        $query_patient_notes_by_month = DB::table("note_rbts")->where("note_rbts.deleted_at",NULL)
                        ->whereMonth("note_rbts.session_date", $month)
                        ->where("note_rbts.patient_id", $patient_id)
                        ->join("patients","note_rbts.patient_id", "=", "patients.patient_id")
                        ->select(
                            DB::raw("MONTH(note_rbts.session_date) as month"),
                        )->groupBy("month")
                        ->orderBy("month")
                        ->get();
                        
        return response()->json([
            "query_patient_notes_by_month" => $query_patient_notes_by_month,
        ]);               
    }

//     public static function getSalaryMoreThan($salary)
// {
//     return self::where('json_details->salary','>',$salary)->get();
// }

//     public static function getEmployeesBeforeDate($date)
//     {
//         return self::whereDate("json_extract('json_details', '$.doj')", '<', $date)->get()
//     }
//     public static function findTotalSalary()
//     {
//         return self::select(DB:raw('sum("json_extract('json_details', '$.salary')") as total_salary'))->get();
//     }
    
    

    
}
