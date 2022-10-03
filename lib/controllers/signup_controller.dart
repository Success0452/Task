import 'package:authentication/db/hive/hive_service.dart';
import 'package:authentication/db/hive/user_model.dart';
import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class SignupController extends ChangeNotifier{

  var InputPhoneNumber = TextEditingController();
  var InputFullName = TextEditingController();
  var InputUsername = TextEditingController();
  var InputPassword = TextEditingController();
  var InputConfirmPassword = TextEditingController();

  var hiveService = HiveService();

  signup(){
    if(
    InputPhoneNumber.text.isEmpty && InputFullName.text.isEmpty && InputUsername.text.isEmpty
        && InputPassword.text.isEmpty && InputConfirmPassword.text.isEmpty
    ){
      Get.snackbar("info", "provide all details", duration: const Duration(milliseconds: 1500));
      return;
    }

    var uuid = const Uuid();
    String userId = uuid.v1();

    // check for whether user is present
    var allUsers = hiveService.getAllUser();
    if(allUsers.isNotEmpty){
      for(final users in allUsers){
        if(users.phonenumber == InputPhoneNumber.text){
          Get.snackbar("Info", "phone number already registered", duration: const Duration(milliseconds: 1500));
          return;
        }
      }
    }

    var req = UserModel(
        fullname: InputFullName.text,
        username: InputUsername.text,
        password: InputPassword.text,
        phonenumber: InputPhoneNumber.text,
        userId: userId
    );

    hiveService.createUser(req);
    Get.offAllNamed(RouteHelper.getLoginPage());
    Get.snackbar("Info", "account created successfully, proceed to login", duration: const Duration(milliseconds: 1500));
    notifyListeners();
  }


}