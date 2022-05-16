import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import "package:notifications/controllers/data_controller.dart";

import "package:notifications/places/body/body_place.dart";
import "package:notifications/places/appbar/actions_place.dart";
import "package:notifications/places/appbar/title_place.dart";

class NotificationPlace extends StatefulWidget {
  const NotificationPlace(
      {Key? key, required this.title, required this.notificationData})
      : super(key: key);

  final String title;

  final List<dynamic> notificationData;

  @override
  State<NotificationPlace> createState() => _NotificationPlaceState();
}

class _NotificationPlaceState extends State<NotificationPlace> {
  final NotificationDataController _notificationDataController =
      Get.put(NotificationDataController());

  @override
  void initState() {
    super.initState();

    _notificationDataController.setNotificationData(widget.notificationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: NotificationTitlePlace(title: widget.title),
            actions: <Widget>[NotificationActionsPlace()],
            backgroundColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0.0,
            centerTitle: false),
        body: NotificationItems(),
        backgroundColor: const Color(0xFFFFFFFF));
  }
}
