import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/routes/route.dart';
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
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: Dimensions.height40, left: Dimensions.height20, right: Dimensions.height20),
          children: [
            BigText(text: Constant.WELCOMEBACK, color: AppColors.BLACK, size: Dimensions.font20,),
            SizedBox(height: Dimensions.height40,),
            BigText(text: Constant.ACCOUNT_LOGIN, color: AppColors.BLACK, size: Dimensions.font16,),
            SizedBox(height: Dimensions.height30,),
            AppTextField(
                textEditingController: context.read<LoginController>().InputPhoneNumber,
                hintText: Constant.ENTER_PHONENO
            ),
            SizedBox(height: Dimensions.height20,),
            AppTextField(
                textEditingController: context.read<LoginController>().InputPassword,
                hintText: Constant.ENTER_PASSWD
            ),
            SizedBox(height: Dimensions.height10,),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      WidgetSpan(child: Icon(Icons.mark_chat_read_outlined, size: Dimensions.icon16,)),
                      TextSpan(text: Constant.REMEMBER, style: TextStyle(color: AppColors.BLACK, fontSize: Dimensions.font15/1.1))
                    ]
                  )),
                  Text(Constant.FORGOT_PASSWD, style: TextStyle(color: AppColors.BLACK, fontSize: Dimensions.font15/1.1))
                ],
              ),
            ),
            SizedBox(height: Dimensions.height40,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: Constant.LOGIN,
                  color: AppColors.PRIMARY,
                  width: Dimensions.width40 * 12,
                  height: Dimensions.height40 * 1.3,
                  pressed: () => context.read<LoginController>().login(),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(text: Constant.OR, color: AppColors.BLACK,),
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            ContainerWidget(
              widget: RichText(text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.account_circle_outlined, size: Dimensions.icon20,color: AppColors.WHITE, )),
                  const TextSpan(text: Constant.SPACE),
                  TextSpan(text: Constant.GOOGLELOGIN, style: TextStyle(color: AppColors.WHITE, fontSize: Dimensions.font16),)
                ]
              )),
              color: AppColors.BLACK,
              width: Dimensions.width20,
              height: Dimensions.height40 * 1.3,
            ),
            SizedBox(height: Dimensions.height30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.offNamed(RouteHelper.getSignupPage()),
                  child: RichText(text: TextSpan(
                      text: Constant.NOTACCOUNT,
                      style: TextStyle(fontSize: Dimensions.font16, color: AppColors.BLACK),
                      children: [
                        TextSpan(text: "${Constant.SPACE} ${Constant.SIGN_UP}", style: TextStyle(fontSize: Dimensions.font16, color: AppColors.PRIMARY))
                      ]
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
