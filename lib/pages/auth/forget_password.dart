import 'package:authentication/controllers/home_controller.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/big_text.dart';
import 'package:authentication/widgets/button_widget.dart';
import 'package:authentication/widgets/container_widget.dart';
import 'package:authentication/widgets/small_text.dart';
import 'package:authentication/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: Dimensions.height40, left: Dimensions.height20, right: Dimensions.height20),
          children: [
            BigText(text: Constant.FORGOT_PASSWD, color: AppColors.BLACK, size: Dimensions.font20,),
            SizedBox(height: Dimensions.height40,),
            BigText(text: Constant.PASSWD_CHNG, color: AppColors.BLACK, size: Dimensions.font16,),
            SizedBox(height: Dimensions.height30,),
            AppTextField(
                textEditingController: context.read<HomeController>().currentPassword,
                hintText: Constant.ENTER_PASSWD
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(
                textEditingController: context.read<HomeController>().newPassword,
                hintText: Constant.ENTER_NEW_PASS
            ),
            SizedBox(height: Dimensions.height10,),
            AppTextField(
                textEditingController: context.read<HomeController>().confirmPassword,
                hintText: Constant.ENTER_CONFIRM_PASS
            ),
            SizedBox(height: Dimensions.height40,),
          ],
        ),
      ),
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.height20),
            child: ButtonWidget(
              text: Constant.CHANGE_PASS,
              color: AppColors.PRIMARY,
              width: Dimensions.width40 * 12,
              height: Dimensions.height40 * 1.3,
              pressed: () =>  context.read<HomeController>().resetPassword(),
            ),
          ),
        ],
      ),
    );
  }
}
