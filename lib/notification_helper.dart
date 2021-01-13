import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'details_screen.dart';

class NotificationHelper{
  GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "MainNavigator");
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

   register() {
    _firebaseMessaging.getToken().then((String token) {
      _uploadDevice("mra5809@gmail.com", token);
    });
  }
   _uploadDevice(email, token) async {
    try {
      FormData formData =
      new FormData.fromMap({"email": email, "token": token});

      Response response = await Dio().post(
          YOUR URL TO FILES ON SERVER,
          data: formData);

      var responseServer = jsonDecode(response.data);

      print(responseServer);
    } catch (e) {
      print("Exception Caught: $e");
    }
  }
  Future showNotificationWithDefaultSound(String title , String message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      message,
      platformChannelSpecifics,
      payload: message,
    );
  }
  Future _onSelectNotification(String payload) async {

    navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => DetailsScreen(payload)));
  }

  // constructor
  NotificationHelper( GlobalKey<NavigatorState> navigatorKey){
    var  initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var  initializationSettingsIOS = IOSInitializationSettings();
    var  initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: _onSelectNotification);
    this.navigatorKey = navigatorKey;
  }

  // named constructor
  NotificationHelper.s(){
    var  initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var  initializationSettingsIOS = IOSInitializationSettings();
    var  initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: _onSelectNotification);
}
}