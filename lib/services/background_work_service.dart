import 'package:finalproject/model/repositories.dart';
import 'package:finalproject/services/notification_service.dart';
import 'package:finalproject/shared/cubit/cubit.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundService {
  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      "task-identifier",
      "simpleTask",
      frequency: const Duration(minutes: 15),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(
        callbackDispatcher, // The top level function, aka callbackDispatcher
        isInDebugMode:
        true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
    );
    registerMyTask();
  }

  void cancleAll() {
    Workmanager().cancelAll();
  }

  void cancleTask(String id) {
    Workmanager().cancelByTag(id);
  }
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    //LocalNotificationService().showDailyScheduleNotification(title: 'hallo',body: 'hi hi hih ih',id: 1);
    final cubit = AppCubit(TimeRepository()); // Create an instance of AppCubit
    cubit.fetchTime();
    AppCubit(TimeRepository()).NotificationForAzkarElmasaa();
    AppCubit(TimeRepository()).NotificationForAzkarElspah();
    // LocalNotificationService().showBasicNotification(
    //     id: 4,
    //     title: 'hi hi',
    //     body: 'work manage',
    //     payload: 'work body'); //simpleTask will be emitted here.
    return Future.value(true);
  });
}
