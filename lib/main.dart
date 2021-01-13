import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/details_screen.dart';
import 'package:flutter_notification/notification_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "MainNavigator");
  static NotificationHelper _notificationHelperForBackGround = NotificationHelper.s();
  NotificationHelper _notificationHelper ;
  String _message = '';

  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message)async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      print("begooo $data");
      _notificationHelperForBackGround.showNotificationWithDefaultSound(message["data"]["title"],message["data"]["message"]);

    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      print("begooo $notification");

    }
    return Future<void>.value();
  }

  getMessage(){
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message $message');
          setState(() => _message = message["data"]["message"]);
          _notificationHelper.showNotificationWithDefaultSound(message["data"]["title"],message["data"]["message"]);
        }, onBackgroundMessage: Platform.isIOS ? null :myBackgroundMessageHandler,
        onResume: (Map<String, dynamic> message) async {
          print('on resume $message');
          setState(() => _message = message["data"]["message"]);
          _notificationHelper.showNotificationWithDefaultSound(message["data"]["title"],message["data"]["message"]);
        }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["data"]["message"]);
      _notificationHelper.showNotificationWithDefaultSound(message["data"]["title"],message["data"]["message"]);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notificationHelper = NotificationHelper(navigatorKey);
    getMessage();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Message: $_message"),
                OutlineButton(
                  child: Text("Register My Device"),
                  onPressed: () {
                    _notificationHelper.register();
                  },
                ),
                // Text("Message: $message")
              ]),
        ),
      ),
    );
  }



}