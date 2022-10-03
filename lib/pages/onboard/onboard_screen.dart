import 'package:authentication/routes/route.dart';
import 'package:authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/big_text.dart';
import 'package:authentication/widgets/container_widget.dart';
import 'package:authentication/widgets/small_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/onboard1.svg",
            height: Dimensions.height40 * 8,
            width: Dimensions.width40 * 8,
            fit: BoxFit.contain,
          ),
          SizedBox(height: Dimensions.height30,),
          RichText(
            textAlign: TextAlign.center,
              text: TextSpan(
              text: Constant.BUY,
              style: TextStyle( color: AppColors.PRIMARY, fontSize: Dimensions.font20),
              children: const [
                TextSpan( text: " and ", style: TextStyle( color: AppColors.BLACK)),
                TextSpan(text: Constant.SELL, style: TextStyle( color: AppColors.PRIMARY)),
                TextSpan( text: Constant.APP_DETAILS, style: TextStyle( color: AppColors.BLACK))
              ]
          )),
          SizedBox(height: Dimensions.height20,),
          SmallText(text: Constant.SMALL_DETAILS, color: AppColors.BLACK,),
          SizedBox(height: Dimensions.height30 * 2,),
          ButtonWidget(
              text: Constant.LOGIN,
              color: AppColors.PRIMARY,
              width: Dimensions.width40 * 12,
              height: Dimensions.height40 * 1.3,
            pressed: () => Get.toNamed(RouteHelper.getLoginPage()),
          ),
          SizedBox(height: Dimensions.height10,),
          ButtonWidget(
              text: Constant.SIGN_UP,
              color: AppColors.BLACK,
              width: Dimensions.width40 * 12,
              height: Dimensions.height40 * 1.3,
            pressed: () => Get.toNamed(RouteHelper.getSignupPage()),
          ),
        ],
      ),
    );
  }
}
