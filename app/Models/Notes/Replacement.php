<?php

namespace App\Models\Notes;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Replacement extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        "note_rbt_id",
        "patient_id",
        "replacement",
        "total_trials",
        "number_of_correct_response",

    ];
}
