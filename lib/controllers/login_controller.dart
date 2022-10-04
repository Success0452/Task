import 'package:authentication/db/hive/hive_service.dart';
import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class LoginController extends ChangeNotifier{

  // textField controllers to accept input from user
  var InputPhoneNumber = TextEditingController();
  var InputPassword = TextEditingController();

  // initialization of hiveService class
  var hiveService = HiveService();

  // initialization of hiveBox
  var remember = Hive.box("remember");

  // declaration of login function/method
  login(){
    // check textField for empty values, and return if TextField is empty
    if(InputPhoneNumber.text.isEmpty && InputPassword.text.isEmpty){
      Get.snackbar("info", "provide all details", duration: const Duration(milliseconds: 1500));
      return;
    }
    // make call to the database to search for the particular user
    var user = hiveService.getUser(InputPhoneNumber.text, InputPassword.text);

    // if statement to check the result of the call.
    if(user != null){
      // save user details into a box, to save state
      remember.put("number", user.phonenumber);
      remember.put("fullname", user.fullname);
      remember.put("userId", user.userId);
      remember.put("username", user.userId);

      // navigate to home page at this point
      Get.offNamed(RouteHelper.getHomePage(),);

      // calling reset function to clear the textField
      reset();
    }else{
      // notify the user to verify their details, because user canot be found with the credentials provided
      Get.snackbar("info", "verify your details", duration: const Duration(milliseconds: 1500));
    }
  }

  // this function clear the defined textField
  reset(){
    InputPassword.text = '';
    InputPhoneNumber.text = '';
  }

}