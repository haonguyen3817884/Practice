import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:notifications/places/appbar/actions_place.dart";
import "package:notifications/places/appbar/title_place.dart";

class NotificationAppbarPlace extends StatelessWidget {
  const NotificationAppbarPlace({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: NotificationTitlePlace(title: title),
        actions: <Widget>[NotificationActionsPlace()],
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0.0,
        centerTitle: false);
  }
}
