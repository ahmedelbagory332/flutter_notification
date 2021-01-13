import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class DetailsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _DetailsScreenState();
  }

  DetailsScreen(this.payload);
  String payload;
}

class _DetailsScreenState extends State<DetailsScreen> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("payload: \n${widget.payload}"),


                // Text("Message: $message")
              ]),
        ),
      ),
    );
  }


}