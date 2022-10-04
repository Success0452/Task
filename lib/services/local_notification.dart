import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@drawable/ic_stat_access_alarm');
    const InitializationSettings settings = InitializationSettings( android: androidInitializationSettings);
    await _localNotificationService.initialize(settings);
  }

  Future<NotificationDetails> _notificationDetails() async{
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'channelId',
        'channelName',
      channelDescription: 'description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true
    );

    return const NotificationDetails(android: androidNotificationDetails);
  }

  Future<void> showNotification({ required int id, required String title, required String body}) async{
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  }
}