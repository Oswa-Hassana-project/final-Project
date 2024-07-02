import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finalproject/pages/notification_details.dart';
import 'package:finalproject/services/notification_service.dart';
import 'package:finalproject/shared/cubit/nav_cubit.dart';
import 'package:finalproject/shared/cubit/nav_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override

  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkPermissionStatus();
    _requestPermission();
    // listenToNotificationStream();
  }
  Future<void> _checkPermissionStatus() async {
    final status = await Permission.notification.status;
    setState(() {
      _permissionStatus = status;
    });
  }
  Future<void> _requestPermission() async {
    final status = await Permission.notification.request();
    setState(() {
      _permissionStatus = status;
    });
  }


  // void listenToNotificationStream() {
  //   LocalNotificationService.streamController.stream.listen((notificationResponse) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationDetails(response: notificationResponse,),));
  //   },);
  // }
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavCubit(),
      child: BlocConsumer<NavCubit,NavCubitState>(builder: (context, state) {
        NavCubit cubit=NavCubit.get(context);
        return Scaffold(
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            index: cubit.currentIndex,
            backgroundColor: Colors.grey.shade200,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      }, listener: (context, state) {},)
    );
  }
}
