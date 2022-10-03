import 'package:authentication/pages/auth/forget_password.dart';
import 'package:authentication/pages/home_screen.dart';
import 'package:authentication/pages/auth/login_screen.dart';
import 'package:authentication/pages/main.dart';
import 'package:authentication/pages/onboard/onboard_screen.dart';
import 'package:authentication/pages/auth/signup_screen.dart';
import 'package:authentication/pages/splash/splash_screen.dart';
import 'package:authentication/pages/transfers/confirmation_screen.dart';
import 'package:authentication/pages/transfers/inter_transfer.dart';
import 'package:authentication/pages/transfers/intra_transfer.dart';
import 'package:get/get.dart';

class RouteHelper{

  static const String initial = "/";
  static const String onboard = "/onboard";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String home = "/home";
  static const String forget_pass = "/forget_pass";
  static const String bank = "/bank";
  static const String transfer = "/transfer";
  static const String confirm = "/confirm";
  static const String inter_transfer = "/inter_transfer";


  static String getInitialPage() => "$initial";
  static String getOnboardPage() => "$onboard";
  static String getLoginPage() => "$login";
  static String getSignupPage() => "$signup";
  static String getHomePage() => "$home";
  static String getPasswordPage() => "$forget_pass";
  static String getBankPage() => "$bank";
  static String getTransferPage() => "$transfer";
  static String getConfirmPage() => "$confirm";
  static String getInterTransferPage() => "$inter_transfer";

  static List<GetPage> routes = [

    GetPage(name: initial, page: () => const SplashScreen(), transition: Transition.fade),
    GetPage(name: onboard, page: () => const OnboardScreen(), transition: Transition.fade),
    GetPage(name: login, page: () => const LoginScreen(), transition: Transition.fade),
    GetPage(name: signup, page: () => const SignupScreen(), transition: Transition.fade),
    GetPage(name: home, page: () => const HomeScreen(), transition: Transition.fade),
    GetPage(name: forget_pass, page: () => const ForgetPasswordScreen(), transition: Transition.fade),
    GetPage(name: bank, page: () => const MainScreen(), transition: Transition.fade),
    GetPage(name: transfer, page: () => const TransferPage(), transition: Transition.fade),
    GetPage(name: confirm, page: () => const ConfirmationScreen(), transition: Transition.fade),
    GetPage(name: inter_transfer, page: () => const IntraTransfer(), transition: Transition.fade),

  ];



}