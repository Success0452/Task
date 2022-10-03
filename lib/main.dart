import 'package:authentication/controllers/home_controller.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/controllers/signup_controller.dart';
import 'package:authentication/controllers/splash_controller.dart';
import 'package:authentication/db/hive/user_model.dart';
import 'package:authentication/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>("users");
  await Hive.openBox("remember");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => SignupController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.getInitialPage(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}
