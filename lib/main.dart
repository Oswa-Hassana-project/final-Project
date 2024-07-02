import 'package:bloc/bloc.dart';
import 'package:finalproject/Layout/nav_page.dart';
import 'package:finalproject/chatbot/chatBot.dart';
import 'package:finalproject/pages/azkaePage.dart';
import 'package:finalproject/pages/chatPage.dart';
import 'package:finalproject/pages/edit_profile.dart';
import 'package:finalproject/pages/elqepla_page.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/notificationsPage.dart';
import 'package:finalproject/pages/sign_up.dart';
import 'package:finalproject/services/BlocObserver.dart';
import 'package:finalproject/services/background_work_service.dart';
import 'package:finalproject/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(
      [LocalNotificationService.init(), BackgroundService().init()]);
  // await LocalNotificationService.init();
  // await BackgroundService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xff13a795),
      ),
      debugShowCheckedModeBanner: false,
      home: homepage(),
      routes: {
        'azkar_page': (context) => AzkarPage(), // Define the route
      },
    );
  }
}
