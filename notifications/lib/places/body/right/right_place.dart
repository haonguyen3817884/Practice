import 'package:flutter/material.dart';
import "package:notifications/places/body/right/right_top_place.dart";
import "package:notifications/places/body/right/right_bottom_place.dart";

class NotificationItemRight extends StatelessWidget {
  const NotificationItemRight(
      {Key? key,
      required this.message,
      required this.places,
      required this.date})
      : super(key: key);

  final String message;
  final List<dynamic> places;

  final String date;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: SizedBox(
            child: Column(children: <Widget>[
      NotificationItemRightTop(message: message, places: places),
      const SizedBox(height: 1.4),
      NotificationItemRightBottom(date: date)
    ], crossAxisAlignment: CrossAxisAlignment.start)));
  }
}
