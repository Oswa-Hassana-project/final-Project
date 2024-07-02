import 'package:finalproject/pages/notification_details.dart';
import 'package:finalproject/services/notification_service.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _hasPermissions = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPermissionStatus();
    // listenToNotificationStream();
  }
  // void listenToNotificationStream() {
  //   LocalNotificationService.streamController.stream.listen((notificationResponse) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationDetails(response: notificationResponse,),));
  //   },);
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Notification Permission"),),
      body: Builder(
        builder: (context) {
          if (_hasPermissions) {
            // Replace _buildCompass() with your desired widget content
            return Center(
              child: Text('Notification Permission Granted!'),
            );
          } else {
            return _buildPermissionSheet();
          }
        },
      ),
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: ElevatedButton(
        child: const Text('Request Notification Permissions'),
        onPressed: () {
          _requestPermission();
        },
      ),
    );
  }

  Future<void> _requestPermission() async {
    final status = await Permission.notification.request();
    setState(() {
      _hasPermissions = status == PermissionStatus.granted;
    });

    if (status == PermissionStatus.denied) {
      _showPermissionDeniedDialog();
    }
    print(status);
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Notification Permissions Required'),
        content: Text('Please enable notification permissions in app settings to receive notifications.'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Open Settings'),
            onPressed: () {
              openAppSettings(); // Opens app settings so user can grant permission
            },
          ),
        ],
      ),
    );
  }


  void _fetchPermissionStatus() {
    Permission.notification.status.then((status) {
      if (mounted) {
        setState(() {
          _hasPermissions = status == PermissionStatus.granted;
        });
      }
    });
  }
}
