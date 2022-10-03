import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject{
  @HiveField(0)
  String? fullname;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? phonenumber;
  @HiveField(4)
  String? userId;

  UserModel({required this.fullname, required this.username, required this.password, required this.phonenumber, required this.userId});
}