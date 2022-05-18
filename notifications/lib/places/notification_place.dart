import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import "package:notifications/controllers/data_controller.dart";

import "package:notifications/places/body/body_place.dart";
import "package:notifications/places/appbar/actions_place.dart";
import "package:notifications/places/appbar/title_place.dart";

class NotificationPlace extends GetView<NotificationDataController> {
  const NotificationPlace(
      {Key? key, required this.title, required this.notificationData})
      : super(key: key);

  final String title;

  final List<dynamic> notificationData;

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationDataController());

    controller.setNotificationData(notificationData);

    return Scaffold(
        appBar: AppBar(
            title: NotificationTitlePlace(title: title),
            actions: <Widget>[NotificationActionsPlace()],
            backgroundColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0.0,
            centerTitle: false),
        body: const NotificationItems(),
        backgroundColor: const Color(0xFFFFFFFF));
  }
}
