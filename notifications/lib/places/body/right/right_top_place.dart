import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:notifications/notification_functions.dart";

import "package:notifications/controllers/place_controller.dart";

class NotificationItemRightTop extends StatelessWidget {
  NotificationItemRightTop(
      {Key? key, required this.message, required this.places})
      : super(key: key);

  final String message;

  final List<dynamic> places;

  final NotificationPlaceController _notificationPlaceController =
      Get.put(NotificationPlaceController());

  TextSpan _getTextWidget(String text,
      {FontWeight textFontWeight = FontWeight.normal}) {
    return TextSpan(
        text: text,
        style: TextStyle(fontSize: 13.6, fontWeight: textFontWeight));
  }

  List<TextSpan> _getMessageWidgets(String itemMessage, List<dynamic> places) {
    List<TextSpan> textPlaces = <TextSpan>[];

    List<dynamic> placePlaces = List.from(places)
      ..addAll(getHighlightPlaces(
          itemMessage, _notificationPlaceController.placeInputValue.value));

    for (int i = 0; i < itemMessage.length; ++i) {
      bool isIn = false;

      for (int index = 0; index < placePlaces.length; ++index) {
        if (i >= placePlaces[index]["offset"] &&
            i < placePlaces[index]["offset"] + placePlaces[index]["length"]) {
          isIn = true;
        }
      }

      if (isIn) {
        textPlaces.add(
            _getTextWidget(itemMessage[i], textFontWeight: FontWeight.bold));
      } else {
        textPlaces.add(_getTextWidget(itemMessage[i]));
      }
    }

    return textPlaces;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 15),
          children: _getMessageWidgets(message, places)),
    );
  }
}
