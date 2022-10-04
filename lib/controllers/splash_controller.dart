import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashController extends ChangeNotifier{

  // initialize hive box
  var remember = Hive.box("remember");

  // declaration of signup function/method
  initialize() async{
    // delay the splash screen for 3 seconds
    await Future.delayed(const Duration(milliseconds: 3000));
    // check whether userId is already present
    if(remember.get("userId") != null){
      // navigate to home page if userId is present
      Get.offNamed(RouteHelper.getHomePage());
    }else{
      // navigate to onboard page if userId is not present
      Get.offAllNamed(RouteHelper.getOnboardPage());
    }

    // notify the user interface
    notifyListeners();
  }

}