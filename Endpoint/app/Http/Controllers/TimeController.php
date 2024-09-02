<?php

namespace App\Http\Controllers;

use Carbon\Carbon;

class TimeController extends Controller
{
 
    public function getTime(){
        return response()->json([
            'current_time' => Carbon::now()->toDateTimeString(),
        ]);
    }
}

