
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:authentication/services/local_notification.dart';
import 'package:flutter/material.dart';

class AlarmController extends ChangeNotifier{

  final int alarmID = 0;

  late final LocalNotificationService service;

  // get current date datas
  var monthOfYear = DateTime.now().month;
  var year = DateTime.now().year;
  var date = DateTime.now().day;


  // create an alarm
  initializeAlarm() async{

    // create a periodic alarm
    await AndroidAlarmManager.periodic(
        const Duration(minutes: 1),
        alarmID,
        fireAlarm(),
      allowWhileIdle: true,
      // specify starting alarm
      startAt: DateTime( year, monthOfYear, date, 18, 14, 10)
    );

    // notify user interface
    notifyListeners();
  }

  // notify through notification
  fireAlarm(){
    service.initialize();
    service.showNotification(id: 0, title: 'Alarm Notification', body: "Wake, Wake, Wake");
  }
}