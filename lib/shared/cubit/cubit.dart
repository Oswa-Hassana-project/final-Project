import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:finalproject/main.dart';
import 'package:finalproject/model/dataModel.dart';
import 'package:finalproject/model/repositories.dart';
import 'package:finalproject/services/notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:finalproject/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppCubit extends Cubit<AppStates>{
  final TimeRepository _repository;
  late Timer  _timer;
  late LocalNotificationService _notificationService;
  AppCubit(this._repository):super(AppInitalState()){
    _notificationService = LocalNotificationService();
    LocalNotificationService.init(); // Initialize notification service
    _timer = Timer.periodic(Duration(seconds: 1), (_) => fetchTime());
  }

  static AppCubit get(context)=> BlocProvider.of(context);
  DateTime now =DateTime.now();
  bool isPassword =true;
  String Time="";
  Duration timeUntilNextPrayer = Duration.zero;
  String nextPrayer = "";
  DateTime? mostRecentPrayerTime;
  Duration? timeFromLastPrayer= Duration.zero;
  String mostRecentPrayerName2 = "";

  void PasswordIsShow (){
    isPassword =!isPassword;
    emit(PasswordShow());
    fetchTime();
  }
  Future<void> fetchTime() async {
    //emit(LoadingAppState());
    try {
      final time = await _repository.getTime();
      final currentTime = DateTime.now();
      Time = '${currentTime.hour}:${currentTime.minute}';
      calculateNextPrayer(currentTime, time[0]);
      emit(LoadAzanTimeState(time));
    } catch (e) {
      print(e.toString());
      emit(ErrorAppState( e.toString()));
    }
  }

  void calculateNextPrayer(DateTime now, TimeAzanModel azanTime) {
    List<Map<String, String>> prayers = [
      {"name": "الفجر", "time": azanTime.Fajr},
      {"name": "الظهر", "time": azanTime.Dhuhr},
      {"name": "العصر", "time": azanTime.Asr},
      {"name": "المغرب", "time": azanTime.Maghrib},
      {"name": "العشاء", "time": azanTime.Isha},
    ];

    DateTime nearestPrayerTime = DateTime(now.year, now.month, now.day, 23, 59);
    String nextPrayerName = "";
    String mostRecentPrayerName = "";

    for (var prayer in prayers) {
      DateTime prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(prayer["time"]!.split(":")[0]),
        int.parse(prayer["time"]!.split(":")[1]),
      );

      if (prayerTime.isAfter(now) && prayerTime.isBefore(nearestPrayerTime)) {
        nearestPrayerTime = prayerTime;
        nextPrayerName = prayer["name"]!;
        nextPrayer = nextPrayerName;
      }

      if (prayerTime.isBefore(now)) {
        if (mostRecentPrayerTime == null || prayerTime.isAfter(mostRecentPrayerTime!)) {
          mostRecentPrayerTime = prayerTime;
          mostRecentPrayerName = prayer["name"]!;
        }
      }
    }
      if (nextPrayerName.isEmpty) {
        nextPrayer = nextPrayerName;
        // All prayers for the day are done
      if (nextPrayerName.isEmpty && mostRecentPrayerTime != null) {
        timeFromLastPrayer = now.difference(mostRecentPrayerTime!);
        print(mostRecentPrayerName);
        print('${timeFromLastPrayer?.inHours} : ${timeFromLastPrayer!.inMinutes%60} minutes.');
      }else{
      // Set the next prayer for the next day (e.g., Fajr of the next day)
      nearestPrayerTime = DateTime(now.year, now.month, now.day + 1, int.parse(prayers[0]["time"]!.split(":")[0]), int.parse(prayers[0]["time"]!.split(":")[1]));
      nextPrayerName = prayers[0]["name"]!;}
    }
    // Calculate time until the next prayer
    timeUntilNextPrayer = nearestPrayerTime.difference(now);
    // Schedule notification if 10 minutes away
    NotificationForNextPrayer(nearestPrayerTime, nextPrayerName);
    NotificationForAzkarElspah();
    NotificationForAzkarElmasaa();
    NotificationForNowPrayer(nearestPrayerTime, nextPrayerName);

  }
  void NotificationForNextPrayer(DateTime prayerTime, String prayerName) {
    final now = DateTime.now();
    final duration = prayerTime.difference(now);
    if (duration.inSeconds == 600) {
      _notificationService.showBasicNotification(
        id: 0,
        title: ' اقتربت صلاه ${prayerName}',
        body: 'باقي عل صلاه ${prayerName} 10 دقائق',
        payload: 'prayer_notification',
      );
    }
  }
  void NotificationForNowPrayer(DateTime prayerTime, String prayerName) {
    final now = DateTime.now();
    final duration = prayerTime.difference(now);
    if (duration.inSeconds==0) {
      _notificationService.showBasicNotification(
        id: 0,
        title: ' صلاه ${prayerName} الان',
        body: 'حان الان وقت صلاه ${prayerName}',
        payload: 'prayer_notification',
      );
    }
  }
  void NotificationForAzkarElspah() {
    final duration = DateTime.now();
    if (duration.hour==9&&duration.minute == 0&&duration.second==0 ) {
      _notificationService.showDailyScheduleNotification(
        id: 0,
        title: 'الاذكار',
        body: 'ابدأ صباحك بأذكار الصباح',
        payload: 'azkar_page',
      );
    }
  }
  void NotificationForAzkarElmasaa() {
    final duration = DateTime.now();
    if (duration.hour == 18 && duration.minute==0 &&duration.second==0) {
      _notificationService.showBasicNotification(
        id: 0,
        title: 'الاذكار',
        body: 'لا تنسي أذكارالمساء',
        payload: 'azkar_page',
      );
    }
  }



  // void GetTimeNow(){
  //   final currentTime = DateTime.now();
  //   if (_lastEmittedTime.minute != currentTime.minute) {
  //     _lastEmittedTime = currentTime;
  //
  //     emit(AppTimeNow());
  //     fetchTime();
  //   }
  // }

  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

  // Future<void> AzanTime()async{
  //   var responce =await http.get(Uri.parse("http://api.aladhan.com/v1/timingsByCity?city=Egyptian General Authority of Survey&country=Egypt&method=5"));
  //   var responceBody = jsonDecode(responce.body);
  //   print(responceBody["data"]["timings"]["Fajr"]);
  //   emit(GetAzanTiming());
  // }






}