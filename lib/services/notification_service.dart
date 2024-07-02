import 'dart:async';
import 'package:finalproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  // static StreamController<NotificationResponse> streamController =
  // StreamController();
  static StreamController<NotificationResponse> streamController = StreamController.broadcast();


  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
    streamController.stream.listen((notificationResponse) {
      // Handle navigation based on payload
      if (notificationResponse.payload == 'azkar_page') {
        // Navigate to AzkarPage
        navigatorKey?.currentState?.pushNamed('azkar_page');
      }
    });
  }

  Future showBasicNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(id, title, body, details,
        payload: payload);
  }

  void showRepeatedNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.everyMinute, details,
        payload: payload);
  }

  showScheduleNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    print(tz.local.name);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        //tz.TZDateTime(tz.local, 2024,6,27,8,7),
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        details,
        payload: payload);
  }

  showDailyScheduleNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    var currentTime = tz.TZDateTime.now(tz.local);
    var scheduleTime= tz.TZDateTime(tz.local, currentTime.year, currentTime.month,
        currentTime.day, currentTime.hour, currentTime.minute);
    print(tz.local.name);
    if(scheduleTime.isBefore(currentTime)){
      scheduleTime= scheduleTime.add(const Duration(seconds: 5));
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduleTime,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        details,
        payload: payload);
  }

  void CancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  void CancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
