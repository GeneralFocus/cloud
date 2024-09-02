<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TimeController;



Route::group(['prefix' => 'v1/'], function () {
    Route::get('time',[TimeController::class, 'getTime']);
});


Route::group(['prefix' => 'v1/'], function () {
    Route::get('/', function(){
        return "Welcome To Shortlet Dot App";
    });

});


Route::fallback(function () {
    return "Unknown Route.... ";
});