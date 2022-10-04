
import 'dart:convert';

import 'package:authentication/model/weather_model.dart';
import 'package:authentication/services/http_routes.dart';
import 'package:authentication/services/server.dart';
import 'package:flutter/material.dart';

class WeatherController extends ChangeNotifier{

  // decalre weather model with a variable
  Weather? weather;

  // declare a function/method to get weather info
  getWeatherInfo(String place) async{
    // declare query parameters needed by the api
    final params = { 'key': '43419ec35c3d461da06222358220310', 'q': place};
    // accept the response into a variable
    var response = await Server.get(HttpRoutes.CURRENT_WEATHER, '', params);
    // decode response into a variable
    var res = json.decode(response);
    // check whether response is not null
    if(response != null){
      //extract response into defined weather model
      // note: the accessment of response should be well defined in the weather model
      weather = Weather.fromJson(res);
    }else{
      // throw an exception if it returns null
      throw Exception("unable to retrieve info");
    }
    // notify user interface
    notifyListeners();
  }

}