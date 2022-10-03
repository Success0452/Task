import 'package:authentication/controllers/home_controller.dart';
import 'package:authentication/routes/route.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var remember = Hive.box("remember");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.BACKKGROUND_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Dimensions.height40 * 2,
        elevation: 0.0,
        backgroundColor: AppColors.BACKKGROUND_COLOR,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: Dimensions.height20),
          child: Container(
            height: Dimensions.height40 * 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: Constant.HOME_PAGE)
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check, size: Dimensions.icon35, color: AppColors.PRIMARY,),
                  Text("${Constant.WELCOME} ${remember.get("fullname")}", style: TextStyle(fontSize: Dimensions.font20),),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getPasswordPage());
                      },
                      child: Text(
                        Constant.RESET_PASS,
                        style: TextStyle(
                            color: AppColors.PRIMARY,
                            decoration: TextDecoration.underline,
                            fontSize: Dimensions.font20
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getBankPage());
                      },
                      child: Text(
                        Constant.GOTOTRANS,
                        style: TextStyle(
                            color: AppColors.PRIMARY,
                            decoration: TextDecoration.underline,
                            fontSize: Dimensions.font20
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getWeatherPage());
                      },
                      child: Text(
                        Constant.GOTOWEATHER,
                        style: TextStyle(
                            color: AppColors.PRIMARY,
                            decoration: TextDecoration.underline,
                            fontSize: Dimensions.font20
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getBankPage());
                      },
                      child: Text(
                        Constant.GOTOALARM,
                        style: TextStyle(
                            color: AppColors.PRIMARY,
                            decoration: TextDecoration.underline,
                            fontSize: Dimensions.font20
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<HomeController>().logout();
                      },
                      child: Text(
                        Constant.LOG_OUT,
                        style: TextStyle(
                            color: AppColors.PRIMARY,
                            decoration: TextDecoration.underline,
                            fontSize: Dimensions.font20
                        ),
                      )
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
