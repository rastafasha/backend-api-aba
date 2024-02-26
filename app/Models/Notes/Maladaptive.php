<?php

namespace App\Models\Notes;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Maladaptive extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable=[
        "note_rbt_id",
        "patient_id",
        "maladaptive",
        "number_of_occurrences",

    ];
}
