import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:notifications/models/notification_item.dart";

import "package:notifications/places/body/left/left_place.dart";

import "package:notifications/places/body/right/right_place.dart";

import "package:notifications/controllers/data_controller.dart";

class NotificationItem extends GetView<NotificationDataController> {
  const NotificationItem({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: GestureDetector(
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 11, right: 15, left: 15, bottom: 11),
                    child: Row(children: <Widget>[
                      NotificationItemLeft(image: item.image, icon: item.icon),
                      const SizedBox(width: 14),
                      Flexible(
                          child: NotificationItemRight(
                              message: item.message["text"].split(":")[0],
                              places: item.message["highlights"],
                              date: Item.getItemDate(item.receivedAt)))
                    ])),
                color: item.getItemColor(),
                elevation: 0.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onTap: () {
              controller.updateStatusNotificationData(item.id);
            }));
  }
}
