import 'package:authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/big_text.dart';
import 'package:authentication/widgets/container_widget.dart';
import 'package:authentication/widgets/small_text.dart';
import 'package:authentication/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/button_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: Dimensions.height40, left: Dimensions.height20, right: Dimensions.height20),
          children: [
            BigText(text: Constant.WELCOME, color: AppColors.BLACK, size: Dimensions.font20,),
            SizedBox(height: Dimensions.height40,),
            BigText(text: Constant.TASK_SIGNUP, color: AppColors.BLACK, size: Dimensions.font16,),

            SizedBox(height: Dimensions.height30,),
            AppTextField(
                textEditingController: context.read<SignupController>().InputFullName,
                hintText: Constant.INPUT_FULLNAME
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(
                textEditingController: context.read<SignupController>().InputUsername,
                hintText: Constant.INPUTUSERNAME
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(
                textEditingController: context.read<SignupController>().InputPhoneNumber,
                hintText: Constant.INPUTPHONENO
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(
                textEditingController: context.read<SignupController>().InputPassword,
                hintText: Constant.ENTER_PASSWD
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(
                textEditingController: context.read<SignupController>().InputConfirmPassword,
                hintText: Constant.INPUTCONFIRMPASSWD
            ),

            SizedBox(height: Dimensions.height10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                    text: TextSpan(
                    children: [
                      WidgetSpan(child: Icon(Icons.mark_chat_read_outlined, size: Dimensions.icon16,)),
                      TextSpan(text: Constant.SIGNUP_WARNING, style: TextStyle(color: AppColors.BLACK, fontSize: Dimensions.font15)),
                      TextSpan(text: Constant.TERMSANDCON, style: TextStyle(color: AppColors.PRIMARY, fontSize: Dimensions.font15))
                    ]
                )),
              ],
            ),
            SizedBox(height: Dimensions.height40,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: Constant.SIGN_UP,
                  color: AppColors.BLACK,
                  width: Dimensions.width40 * 12,
                  height: Dimensions.height40 * 1.3,
                  pressed: () => context.read<SignupController>().signup(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
