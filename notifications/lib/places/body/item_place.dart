import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:notifications/models/item.dart";

import "package:notifications/places/body/left/left_place.dart";

import "package:notifications/places/body/right/right_place.dart";

import "package:notifications/controllers/data_controller.dart";

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    final NotificationDataController _notificationDataController =
        Get.put(NotificationDataController());

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
                          message: item.getItemMessage()["text"].split(":")[0],
                          places: item.getItemMessage()["highlights"],
                          date: Item.getItemDate(item.getItemReceivedAt()))
                    ])),
                color: item.getItemColor(),
                elevation: 0.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onTap: () {
              _notificationDataController
                  .updateStatusNotificationData(item.getItemId());
            }));
  }
}
