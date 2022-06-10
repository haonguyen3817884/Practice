import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "package:notifications/places/body/body_place.dart";
import "package:notifications/places/appbar/actions_place.dart";
import "package:notifications/places/appbar/title_place.dart";

class NotificationPlace extends StatelessWidget {
  const NotificationPlace({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: NotificationTitlePlace(title: title),
            actions: const <Widget>[NotificationActionsPlace()],
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
