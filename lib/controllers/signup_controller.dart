import 'package:authentication/db/hive/hive_service.dart';
import 'package:authentication/db/hive/user_model.dart';
import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class SignupController extends ChangeNotifier{

  // textField controllers to accept input from user
  var InputPhoneNumber = TextEditingController();
  var InputFullName = TextEditingController();
  var InputUsername = TextEditingController();
  var InputPassword = TextEditingController();
  var InputConfirmPassword = TextEditingController();

  // initialization of hiveService class
  var hiveService = HiveService();

  // declaration of signup function/method
  signup(){
    // check textField for empty values, and return if TextField is empty
    if(
    InputPhoneNumber.text.isEmpty && InputFullName.text.isEmpty && InputUsername.text.isEmpty
        && InputPassword.text.isEmpty && InputConfirmPassword.text.isEmpty
    ){
      // notify user of an empty details
      Get.snackbar("info", "provide all details", duration: const Duration(milliseconds: 1500));
      return;
    }

    // initailization of Uuid
    var uuid = const Uuid();
    String userId = uuid.v1();

    // make call to database to check whether user is present
    var allUsers = hiveService.getAllUser();

    // if statement to check the result of the call.
    if(allUsers.isNotEmpty){
      // loop through the users to identify whether user is present
      for(final users in allUsers){
        if(users.phonenumber == InputPhoneNumber.text){
          // notify user about an already registered phone number
          Get.snackbar("Info", "phone number already registered", duration: const Duration(milliseconds: 1500));
          return;
        }
      }
    }

    // passing queries through model
    var req = UserModel(
        fullname: InputFullName.text,
        username: InputUsername.text,
        password: InputPassword.text,
        phonenumber: InputPhoneNumber.text,
        userId: userId
    );

    // make call to database to create a user
    hiveService.createUser(req);

    // navigate user to login page upon creation
    Get.offAllNamed(RouteHelper.getLoginPage());
    // calling reset function to clear the textField
    reset();
    // notify user of account created
    Get.snackbar("Info", "account created successfully, proceed to login", duration: const Duration(milliseconds: 1500));
    // notify user interface
    notifyListeners();
  }

  // this function clear the defined textField
  reset(){
    InputPassword.text = '';
    InputPhoneNumber.text = '';
    InputFullName.text = '';
    InputUsername.text = '';
    InputConfirmPassword.text = '';
  }
}