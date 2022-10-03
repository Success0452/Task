import 'package:authentication/db/hive/hive_service.dart';
import 'package:authentication/db/hive/user_model.dart';
import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class HomeController extends ChangeNotifier{

  var currentPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();

  var hiveService = HiveService();
  var remember = Hive.box("remember");

  resetPassword(){
    if(currentPassword.text.isEmpty && newPassword.text.isEmpty && confirmPassword.text.isEmpty){
      Get.snackbar("info", "provide all details", duration: const Duration(milliseconds: 1500));
      return;
    }
    var user = hiveService.getUser(remember.get("number"), currentPassword.text);

    if(user != null){
      var req = UserModel(
          fullname: remember.get("fullname"),
          username: remember.get("username"),
          password: currentPassword.text,
          phonenumber: remember.get("number"),
          userId: remember.get("userId")
      );
      hiveService.updateUser(req);
      Get.offAllNamed(RouteHelper.getHomePage());
      Get.snackbar("info", "password changed", duration: const Duration(milliseconds: 1500));
    }else{
      Get.snackbar("info", "current password is incorrect", duration: const Duration(milliseconds: 1500));
    }
    notifyListeners();
  }

  logout(){
    remember.delete("number");
    remember.delete("fullname");
    remember.delete("userId");
    remember.delete("username");
    Get.offAllNamed(RouteHelper.getOnboardPage());
    notifyListeners();
  }

}