import 'package:authentication/db/hive/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService{

  void createUser(UserModel userModel) async{
    var notification = Hive.box<UserModel>("users");
    notification.add(userModel);
  }


  List<UserModel> getAllUser(){
    var notification = Hive.box<UserModel>("users");
    return notification.values.toList();
  }

  UserModel? getUser(String? phoneNumber, String password){
    var notification = Hive.box<UserModel>("users");
    final notify = notification.values.where((element) => element.phonenumber == phoneNumber && element.password == password);
    if(notify.isEmpty){
      return null;
    }else{
      return notify.first;
    }
  }

  void deleteUser(String userId)async{
    var notification = Hive.box<UserModel>("users");
    final deleteItem = notification.values.firstWhere((element) => element.userId == userId);
    await deleteItem.delete();
  }

  void updateUser(UserModel userModel)async{
    var notification = Hive.box<UserModel>("users");
    final updateItem = notification.values.firstWhere((element) => element.userId == userModel.userId);
    final index = updateItem.key as int;
    await notification.put(index, userModel);
  }

}