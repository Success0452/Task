import 'package:authentication/db/hive/hive_service.dart';
import 'package:authentication/db/hive/user_model.dart';
import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class HomeController extends ChangeNotifier{

  // textField controllers to accept input from user
  var currentPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();

  var purpose = TextEditingController();
  var receive_account = TextEditingController();
  var amount = TextEditingController();

  // initialization of hiveService class
  var hiveService = HiveService();
  // initialization of hiveBox
  var remember = Hive.box("remember");

  // declaration of signup function/method
  resetPassword(){
    // check textField for empty values, and return if TextField is empty
    if(currentPassword.text.isEmpty && newPassword.text.isEmpty && confirmPassword.text.isEmpty){
      Get.snackbar("info", "provide all details", duration: const Duration(milliseconds: 1500));
      return;
    }
    // get the user details with the number in the saved state
    var user = hiveService.getUser(remember.get("number"), currentPassword.text);

    // verify whether user state is present
    if(user != null){
      // declaring user derails, to locate a particular user
      var req = UserModel(
          fullname: remember.get("fullname"),
          username: remember.get("username"),
          password: currentPassword.text,
          phonenumber: remember.get("number"),
          userId: remember.get("userId")
      );
      // calling the database to update user password
      hiveService.updateUser(req);
      // navigate user to home page
      Get.offAllNamed(RouteHelper.getHomePage());
      // notify the user of changed password
      Get.snackbar("info", "password changed", duration: const Duration(milliseconds: 1500));
    }else{
      // notify the user about an incorrect password
      Get.snackbar("info", "current password is incorrect", duration: const Duration(milliseconds: 1500));
    }
    // notify user interface
    notifyListeners();
  }

  // clear the user state when the user decides to logout
  logout(){
    remember.delete("number");
    remember.delete("fullname");
    remember.delete("userId");
    remember.delete("username");
    Get.offAllNamed(RouteHelper.getOnboardPage());
    notifyListeners();
  }

}