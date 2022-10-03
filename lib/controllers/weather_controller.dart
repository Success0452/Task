
import 'dart:convert';

import 'package:authentication/model/weather_model.dart';
import 'package:authentication/server/http_routes.dart';
import 'package:authentication/server/service.dart';
import 'package:flutter/material.dart';

class WeatherController extends ChangeNotifier{

  Weather? weather;

  getWeatherInfo(String place) async{
    final params = { 'key': '43419ec35c3d461da06222358220310', 'q': place};
    var response = await Server.get(HttpRoutes.CURRENT_WEATHER, '', params);
    print(response);
    var res = json.decode(response);
    if(response != null){
      weather = Weather.fromJson(res);
    }else{
      throw Exception("unable to retrieve info");
    }
    notifyListeners();
  }

}