import 'package:authentication/controllers/weather_controller.dart';
import 'package:authentication/util/colors.dart';
import 'package:authentication/util/constant.dart';
import 'package:authentication/util/dimensions.dart';
import 'package:authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<WeatherController>().getWeatherInfo("Nigeria");
    return Scaffold(
      backgroundColor: AppColors.PRIMARY,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.location_searching, size: Dimensions.icon24, color: Colors.yellow,),
                    Text(context.read<WeatherController>().weather!.country,
                      style: TextStyle( color: Colors.yellow, fontSize: Dimensions.font26 * 1.3, fontWeight: FontWeight.bold),),
                    SizedBox(height: Dimensions.height20,),
                    ButtonWidget(
                      text: Constant.TURN_ON,
                      color: Colors.yellow[800]!,
                      width: Dimensions.width40 * 12,
                      height: Dimensions.height40 * 1.3,
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Text(context.read<WeatherController>().weather!.temperatureC.toString().split(".")[0],
                      style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font26 * 4, fontWeight: FontWeight.bold),),
                    SizedBox(height: Dimensions.height20,),
                    Text( context.read<WeatherController>().weather!.condition,
                      style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font26 * 1.5, fontWeight: FontWeight.bold),),
                    SizedBox(height: Dimensions.height20,),
                    ButtonWidget(
                      text: context.read<WeatherController>().weather!.location,
                      color: Colors.yellow[800]!,
                      width: Dimensions.width40 * 7,
                      height: Dimensions.height40 * 1.3,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: Dimensions.width25, top: Dimensions.height20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text( "More details >",
                    style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font16/1.3, decoration: TextDecoration.underline),),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: Dimensions.width25,),
                          Icon(Icons.thunderstorm_outlined, size: Dimensions.icon24, color: AppColors.WHITE,),
                          SizedBox(width: Dimensions.width15,),
                          Text( "Today  ${context.read<WeatherController>().weather!.condition}",
                            style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font15, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.width25),
                        child: Text(
                          "${context.read<WeatherController>().weather!.temperatureC.toString().split(".")[0]}/"
                            "${context.read<WeatherController>().weather!.temperatureF.toString().split(".")[0]}",
                          style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font15, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: Dimensions.width25,),
                          Icon(Icons.thunderstorm_outlined, size: Dimensions.icon24, color: AppColors.WHITE,),
                          SizedBox(width: Dimensions.width15,),
                          Text( "Today  Humidity",
                            style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font15, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.width25),
                        child: Text( context.read<WeatherController>().weather!.humidity.toString(),
                          style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font15, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: Dimensions.width25,),
                          Icon(Icons.thunderstorm_outlined, size: Dimensions.icon24, color: AppColors.WHITE,),
                          SizedBox(width: Dimensions.width15,),
                          Text( "Today  Cloud",
                            style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font15, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.width25),
                        child: Text( context.read<WeatherController>().weather!.cloud.toString(),
                          style: TextStyle( color: AppColors.WHITE, fontSize: Dimensions.font15, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height15,),
                ButtonWidget(
                  text: "Forecast",
                  color: Colors.yellow[800]!,
                  width: Dimensions.width40 * 10,
                  height: Dimensions.height40 * 1.1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
