<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class RegistroClinico extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        'date',
        'start_in',
        'end_out',
        'total_hour',
        'meet_client_at',
        'client_appeared',
        'as_evidenced_by',
        'RBT_modeled_and_demostrate',
        'responding_this_session_could',
        'progress_noted_this_session',
        'client_response_to_treatment'
    ];


    const pending = 'pending';
    const home = 'home';
    const school = 'school';
    const community = 'community';
    //
    const happy = 'happy';
    const sad = 'sad';
    const exited = 'exited';
    const tired = 'tired';
    const agresive = 'agresive';
    const distracted = 'distracted';
    //
    const smilling_at_RBT = 'smilling at RBT';
    const playing_a_game = 'playing a game';
    const whatching_tv = 'whatching tv';
    const running_to_greet_RBT = 'running to greet RBT';
    const scaping = 'scaping';
    const talking_to_a_friend = 'talking to a friend';
    //
    const redirection = 'redirection';
    const premack_principle = 'premack principle';
    const response_block = 'response block';
    const behavioral_momentum = 'behavioral momentum';
    const DTT = 'DTT';
    //
    const yes = 'yes';
    const no = 'no';
    //
    const excelent = 'excelent';
    const good = 'good';
    const moderate = 'moderate';
    const minimal = 'minimal';
    

    public static function meet_client_atTypes()
    {
        return [
            self::home, self::school,
            self::community, self::pending,
        ];
    }
    public static function client_appearedTypes()
    {
        return [
            self::happy, self::sad,
            self::exited, self::tired,
            self::agresive, self::distracted,
            self::pending,
        ];
    }
    public static function as_evidenced_byTypes()
    {
        return [
            self::smilling_at_RBT, self::playing_a_game,
            self::whatching_tv, self::running_to_greet_RBT,
            self::scaping, self::talking_to_a_friend,
            self::pending,
        ];
    }
    public static function RBT_modeled_and_demostrateTypes()
    {
        return [
            self::redirection, self::premack_principle,
            self::response_block, self::behavioral_momentum,
            self::DTT,self::pending,
        ];
    }
    public static function responding_this_session_couldTypes()
    {
        return [
            self::yes, self::no,
            self::pending,
        ];
    }
    public static function progress_noted_this_sessionTypes()
    {
        return [
            self::excelent, self::good,
            self::moderate, self::minimal,
            self::pending,
        ];
    }
}
