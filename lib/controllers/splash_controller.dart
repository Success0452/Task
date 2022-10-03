import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashController extends ChangeNotifier{

  var remember = Hive.box("remember");

  initialize() async{
    await Future.delayed(const Duration(milliseconds: 3000));
    if(remember.get("userId") != null){
      Get.offNamed(RouteHelper.getHomePage());
    }else{
      Get.offAllNamed(RouteHelper.getOnboardPage());
    }
    notifyListeners();
  }

}