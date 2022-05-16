import 'package:flutter/material.dart';

import "package:notifications/notification_data.dart";
import "package:notifications/places/notification_place.dart";

void main() {
  var notificationData = getData();

  runApp(MyApp(notificationData: notificationData["data"]));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.notificationData}) : super(key: key);

  final List<dynamic> notificationData;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black)),
      home: NotificationPlace(
          title: "Notification", notificationData: notificationData),
    );
  }
}
