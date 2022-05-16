import 'package:flutter/material.dart';
import "package:notifications/models/item.dart";

import "package:notifications/places/body/left/left_place.dart";

import "package:notifications/places/body/right/right_place.dart";

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {Key? key,
      required this.item,
      required this.updateStatusNotificationData,
      required this.placeValue})
      : super(key: key);
  final Item item;

  final Function updateStatusNotificationData;

  final String placeValue;

  Color _getItemColor(Color color1, Color color5) {
    return ("unread" == item.getItemStatus()) ? color5 : color1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: GestureDetector(
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 11, right: 15, left: 15, bottom: 11),
                    child: Row(children: <Widget>[
                      NotificationItemLeft(
                          image: item.getItemImage(), icon: item.getItemIcon()),
                      const SizedBox(width: 14),
                      NotificationItemRight(
                          placeValue: placeValue,
                          message: item.getItemMessage()["text"].split(":")[0],
                          places: item.getItemMessage()["highlights"],
                          date: Item.getItemDate(item.getItemReceivedAt()))
                    ])),
                color:
                    _getItemColor(const Color(0xFFECF7E7), Colors.transparent),
                elevation: 0.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onTap: () {
              updateStatusNotificationData();
            }));
  }
}
