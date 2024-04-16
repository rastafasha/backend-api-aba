<?php

namespace App\Models\Billing;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Notes\NoteRbt;
use App\Models\Patient\Patient;
use App\Models\Insurance\Insurance;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ClientReport extends Model
{
    use HasFactory;
    protected $fillable=[
        'patient_id',
        'sponsor_id',
        'charges',
        'billed',
        'cpt_code',
        'insurer_id',
        'md',
        'md2',
        'n_units',
        'pa_number',
        'pay',
        'pos',
        'session_date',
        'total_hours',
        'xe',
    ];


    public function patient()
    {
        return $this->hasMany(Patient::class);
    }
    public function sponsor()
    {
        return $this->hasMany(User::class);
    }

    public function insurance()
    {
        return $this->hasMany(Insurance::class);
    }
    public function note_rbt()
    {
        return $this->hasMany(NoteRbt::class);
    }

     // filtro buscador

     public function scopefilterAdvance($query, $name_doctor, $session_date){
        
        if($name_doctor){
            $query->whereHas("doctor", function($q)use($name_doctor){
                $q->where("name", "like","%".$name_doctor."%")
                    ->orWhere("surname", "like","%".$name_doctor."%");
            });
        }

        if($session_date){
            $query->whereDate("session_date", Carbon::parse($session_date)->format("Y-m-d"));
        }
        return $query;
    }
}
