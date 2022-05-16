import 'package:flutter/material.dart';
import "package:notifications/notification_functions.dart";

class NotificationItemRightTop extends StatelessWidget {
  const NotificationItemRightTop(
      {Key? key,
      required this.placeValue,
      required this.message,
      required this.places})
      : super(key: key);

  final String placeValue;

  final String message;

  final List<dynamic> places;

  TextSpan _getTextWidget(String text,
      {FontWeight textFontWeight = FontWeight.normal}) {
    return TextSpan(
        text: text,
        style: TextStyle(fontSize: 13.6, fontWeight: textFontWeight));
  }

  List<TextSpan> _getMessageWidgets(
      String itemMessage, List<dynamic> places, String customerValue) {
    List<TextSpan> textPlaces = <TextSpan>[];

    List<dynamic> placePlaces = new List.from(places)
      ..addAll(getHighlightPlaces(itemMessage, customerValue));

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
          children: _getMessageWidgets(message, places, placeValue)),
    );
  }
}
