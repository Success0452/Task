import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/routes/route.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/button_widget.dart';
import 'package:authentication/widgets/container_widget.dart';
import 'package:authentication/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class IntraTransfer extends StatefulWidget {
  const IntraTransfer({Key? key}) : super(key: key);

  @override
  State<IntraTransfer> createState() => _IntraTransferState();
}

class _IntraTransferState extends State<IntraTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Dimensions.height40 * 2,
        elevation: 0.0,
        backgroundColor: Colors.grey.shade300,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width40),
          child: SizedBox(
            height: Dimensions.height40 * 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Dimensions.width40 * 1.2,
                  height: Dimensions.height40 * 1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                          color: AppColors.BLACK
                      )
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back_outlined, color: AppColors.BLACK, size: Dimensions.icon20,),
                  ),
                ),
                SizedBox(width: Dimensions.width40 * 5,),
                Text(Constant.TRANSFER, style: TextStyle( color: AppColors.BLACK, fontSize: Dimensions.font20 * 1.3, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width40),
              child: Text(Constant.FROM, style: TextStyle( color: AppColors.BLACK, fontSize: Dimensions.font20),),
            ),
            SizedBox(height: Dimensions.height10,),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30),
              child: Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height40 * 2.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.PRIMARY
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Constant.ACCOUNT, style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font20, fontWeight: FontWeight.bold),),
                    SizedBox(height: Dimensions.height10,),
                    Text(Constant.ACCTNUM, style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font20, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimensions.height15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Dimensions.height30,
                  height: Dimensions.width30,
                  decoration: const BoxDecoration(
                      color: AppColors.PRIMARY,
                      shape: BoxShape.circle
                  ),
                ),
                Container(
                  width: Dimensions.height30,
                  height: Dimensions.width30,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle
                  ),
                ),
                Container(
                  width: Dimensions.height30,
                  height: Dimensions.width30,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle
                  ),
                )
              ],
            ),
            SizedBox(height: Dimensions.height20,),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30),
              child: Text(Constant.TO, style: TextStyle( color: AppColors.BLACK, fontSize: Dimensions.font20),),
            ),
            SizedBox(height: Dimensions.height10,),
            SizedBox(
              width: Dimensions.screenWidth,
              height: Dimensions.height40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                      child: SizedBox(
                        width: Dimensions.width40 * 2.5,
                        height: Dimensions.height40 * 2.5,
                        child: CircleAvatar(
                          backgroundColor: AppColors.BLACK,
                          child: Icon(Icons.add, size: Dimensions.icon20, color: AppColors.WHITE,),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: Dimensions.height30,),
            AppTextField(
                textEditingController: context.read<LoginController>().InputPhoneNumber,
                hintText: Constant.AMOUNT
            ),
            SizedBox(height: Dimensions.height30,),
            AppTextField(
                textEditingController: context.read<LoginController>().InputPhoneNumber,
                hintText: Constant.RECEIVERACCOUNT
            ),
            SizedBox(height: Dimensions.height20,),
            SizedBox(height: Dimensions.height10,),
            AppTextField(
                textEditingController: context.read<LoginController>().InputPassword,
                hintText: Constant.PURPOSE
            ),
            SizedBox(height: Dimensions.height10,),
          ],
        ),
      ),
      bottomSheet:  Container(
        color: Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.only(bottom: Dimensions.height20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: Constant.CHANGE_PASS,
                color: AppColors.BLACK,
                width: Dimensions.width40 * 12,
                height: Dimensions.height40 * 1.3,
                pressed: (){
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => addBuildSheet2(),
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget makeDismissible({required Widget child}) => GestureDetector(
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: (){}, child: child,),
  );

  Widget addBuildSheet2() => makeDismissible(
    child: DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 1,
      maxChildSize: 1,
      builder: (_, controller) => Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20))
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(Constant.TRANSFER, style: TextStyle(color: AppColors.BLACK, fontSize: 16),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: Dimensions.screenWidth,
                  height: Dimensions.screenHeight/7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.screenWidth/18)),
                      color: AppColors.WHITE
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Account Name", style: TextStyle(color: AppColors.BLACK, fontSize: 14, fontWeight: FontWeight.bold),),
                              Text(Constant.HOME_NAME, style: TextStyle(color: AppColors.BLACK, fontSize: 14, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        const Divider( color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(Constant.amountTxt, style: TextStyle(color: AppColors.BLACK, fontSize: 14, fontWeight: FontWeight.bold),),
                              Text(Constant.hundredThousand, style: TextStyle(color: AppColors.BLACK, fontSize: 14, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight/20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(Constant.validateTxt, style: TextStyle(color: AppColors.BLACK, fontSize: 16),),
                  SizedBox(height: Dimensions.screenHeight/60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 65, right: 65),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: true,
                      validator: (value) {},
                      length: 4,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        selectedColor: Colors.white,
                        selectedFillColor: Colors.white60,
                        shape: PinCodeFieldShape.box,
                        activeColor: Colors.white60,
                        disabledColor: Colors.white,
                        inactiveColor: Colors.grey,
                        inactiveFillColor: AppColors.WHITE,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 50,
                        activeFillColor: AppColors.WHITE,
                      ),
                      cursorColor: AppColors.BLACK,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (value) {},
                      onTap: () {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        //if you return true then it will show the
                        //paste confirmation dialog. Otherwise if
                        // false, then nothing will happen.
                        //but you can show anything you want here,
                        // like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.screenHeight/60,),
                  ButtonWidget(
                    text: Constant.CONFIRM,
                    color: AppColors.BLACK,
                    width: Dimensions.width40 * 12,
                    height: Dimensions.height40 * 1.3,
                    pressed: () => Get.toNamed(RouteHelper.getConfirmPage()),
                  ),
                ],
              )
            ],
          )
      ),
    ),
  );
}
