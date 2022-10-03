import 'package:authentication/routes/route.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;  // get the full width of the device
    var height = MediaQuery.of(context).size.height; // get the full height of the device
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Center(
                child:  Container(
                  width: width/3,
                  height: height/5,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.BLACK
                  ),
                  child: Center(
                    child: Icon(Icons.check_circle, size: width/3.3, color: AppColors.WHITE,),
                  ),
                ),
              ),
            ),
            SizedBox(height: height/30,),
            const Text(
              Constant.SENT,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.BLACK, decoration: TextDecoration.underline),)
          ],
        ),
      ),
      bottomSheet:  Padding(
        padding: EdgeInsets.only(bottom: width/18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: Constant.CHANGE_PASS,
              color: AppColors.BLACK,
              width: Dimensions.width40 * 12,
              height: Dimensions.height40 * 1.3,
              pressed: () => Get.offAllNamed(RouteHelper.getHomePage()),
            ),
          ],
        ),
      ),
    );
  }
}
