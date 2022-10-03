import 'package:authentication/routes/route.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var users = Hive.box("remember");
  @override
  Widget build(BuildContext context) {
    var width = Dimensions.screenWidth; // get the full width of the device
    var height = Dimensions.screenHeight; // get the full height of the device
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(width/18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: width/35, bottom: width/25),
                    child: Text(
                      "${Constant.WELCOME} ${users.get("fullname")}",
                      textAlign: TextAlign.start,
                      style: TextStyle( color: AppColors.BLACK, fontSize: Dimensions.font20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width/18, right: width/18),
              child: Container(
                width: width,
                height: 180,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Colors.lightBlueAccent, AppColors.BLACK],
                        stops: [0.5, 0.5],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(width/18))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(Constant.balance, style: TextStyle(color: AppColors.BLACK, fontSize: width/28),),
                              SizedBox(height: width/80,),
                              Text(Constant.amount, style: TextStyle(color: AppColors.BLACK, fontWeight: FontWeight.bold, fontSize: width/14),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.WHITE,
                                borderRadius: BorderRadius.all(Radius.circular(width/18))
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.remove_red_eye, color: AppColors.BLACK, size: width/26,),
                                SizedBox(width: 5,),
                                Text(Constant.show, style: TextStyle(color: AppColors.BLACK, fontSize: width/26),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width30, right: Dimensions.width30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(RouteHelper.getTransferPage()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: AppColors.WHITE,
                                    child: Icon(Icons.monetization_on_outlined, color: AppColors.BLACK,),
                                  ),
                                  SizedBox(height: height/200,),
                                  Text(Constant.INTERTRANS, style: TextStyle(color: AppColors.WHITE, fontSize: width/30),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(RouteHelper.getInterTransferPage()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.WHITE,
                                    child: Icon(Icons.monetization_on_outlined, color: AppColors.BLACK,),
                                  ),
                                  SizedBox(height: height/200,),
                                  Text(Constant.INTRATRANS, style: TextStyle(color: AppColors.WHITE, fontSize: width/30),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(RouteHelper.getOnboardPage()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.WHITE,
                                    child: Icon(Icons.monetization_on_outlined, color: AppColors.BLACK,),
                                  ),
                                  SizedBox(height: height/200,),
                                  Text(Constant.explored, style: TextStyle(color: AppColors.WHITE, fontSize: width/30),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width/18, top: height/30),
                  child: Text(Constant.portfolio, style: TextStyle( color: AppColors.BLACK, fontSize: width/24),),
                ),
                SizedBox(height: height/70,),
                Container(
                  width: width,
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, value){
                        return Padding(
                          padding: EdgeInsets.only(left: width/18, right: width/30),
                          child: Container(
                            padding: EdgeInsets.only(left: width/18, top: height/80, bottom: height/80,right: width/18),
                            width: width/1.1,
                            decoration: BoxDecoration(
                                color: AppColors.WHITE,
                                borderRadius: BorderRadius.all(Radius.circular(width/18))
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/onboard1.svg",
                                  height: Dimensions.height40,
                                  width: Dimensions.width40,
                                  fit: BoxFit.contain,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width/120),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(Constant.johnvents, style: TextStyle(color: AppColors.BLACK, fontSize: width/30, fontWeight: FontWeight.bold),),
                                          SizedBox(width: width/6,),
                                          Text(Constant.people, style: TextStyle(color: AppColors.BLACK, fontSize: width/30, fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0, bottom: width/55),
                                          child: Container(
                                            width: width/3,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors: [AppColors.BLACK, AppColors.BLACK],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    stops: const [0.5, 0.5]
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(width/18))
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width/26,),
                                        Text(Constant.nineMonth, style: TextStyle(color: AppColors.BLACK, fontSize: width/30, fontWeight: FontWeight.bold),),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width/28, right: width/28, top: height/60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Constant.exploreInvest, style: TextStyle( color: AppColors.BLACK, fontSize: width/24, fontWeight: FontWeight.bold),),
                  Text(Constant.seeAll, style: TextStyle( color: AppColors.BLACK, fontSize: width/24, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width/30, right: width/24),
              child: SizedBox(
                height: height/2.4,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          height: 120,
                          decoration: BoxDecoration(
                              color: AppColors.WHITE,
                              borderRadius: BorderRadius.all(Radius.circular(width/18))
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/onboard1.svg",
                                  height: Dimensions.height40 * 3,
                                  width: Dimensions.width40 * 1.2,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width/18),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(Constant.johnvents, style: TextStyle( color: AppColors.BLACK, fontSize: width/30, fontWeight: FontWeight.bold),),
                                      Text(Constant.interest, style: TextStyle( color: AppColors.BLACK, fontSize: width/30, fontWeight: FontWeight.bold),),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(Constant.minAmount, textAlign: TextAlign.center, style: TextStyle( color: AppColors.WHITE, fontSize: width/35, fontWeight: FontWeight.bold),),
                                              Text(Constant.hundredThousand, style: TextStyle( color: AppColors.BLACK, fontSize: width/24, fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          SizedBox(width: width/20,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(Constant.peopleBig, textAlign: TextAlign.center, style: TextStyle( color: AppColors.WHITE, fontSize: width/35, fontWeight: FontWeight.bold),),
                                              Text(Constant.twelveThousand, style: TextStyle( color: AppColors.BLACK, fontSize: width/24, fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ],
                                      ),
                                      Text(Constant.ongoing, style: TextStyle( color: AppColors.BLACK, fontSize: width/28, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
