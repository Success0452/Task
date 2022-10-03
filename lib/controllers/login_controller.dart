import 'package:authentication/db/hive/hive_service.dart';
import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class LoginController extends ChangeNotifier{

  var InputPhoneNumber = TextEditingController();
  var InputPassword = TextEditingController();

  var hiveService = HiveService();
  var remember = Hive.box("remember");

  login(){
    if(InputPhoneNumber.text.isEmpty && InputPassword.text.isEmpty){
      Get.snackbar("info", "provide all details", duration: const Duration(milliseconds: 1500));
      return;
    }
    var user = hiveService.getUser(InputPhoneNumber.text, InputPassword.text);
    if(user != null){
      print("first");
      remember.put("number", user.phonenumber);
      remember.put("fullname", user.fullname);
      remember.put("userId", user.userId);
      remember.put("username", user.userId);

      Get.offNamed(
        RouteHelper.getHomePage(),
        arguments: {
          "fullName": user.fullname,
          "phoneNumber": user.phonenumber
      }
      );
    }else{
      print("Second");
      Get.snackbar("info", "verify your details", duration: const Duration(milliseconds: 1500));
    }

  }
}