import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:notifications/notification_functions.dart";

import "package:notifications/models/item.dart";

import "package:notifications/controllers/data_controller.dart";

import "package:notifications/controllers/place_controller.dart";

import "package:notifications/places/body/item_place.dart";

// ignore: must_be_immutable
class NotificationItems extends StatelessWidget {
  NotificationItems({Key? key}) : super(key: key);

  List<Item> _getNotificationDataPlace(List<Item> data, String placeValue) {
    List<Item> notificationDataPlace = <Item>[];

    for (int i = 0; i < data.length; ++i) {
      RegExp regExp = RegExp(placeValue.toLowerCase());

      Item item = data[i];

      String itemMessage = item.getItemMessage()["text"].split(":")[0];
      if (regExp.hasMatch(removePlaceCharacters(itemMessage).toLowerCase())) {
        notificationDataPlace.add(item);
      }
    }

    return notificationDataPlace;
  }

  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final NotificationDataController _notificationDataController =
        Get.put(NotificationDataController());

    final NotificationPlaceController _notificationPlaceController =
        Get.put(NotificationPlaceController());

    return Obx(() {
      List<Item> notificationDataPlace = _getNotificationDataPlace(
          _notificationDataController.notificationData,
          _notificationPlaceController.placeInputValue.value);

      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _notificationPlaceController.updatePlaceLoading(true);

          Future.delayed(
              const Duration(
                milliseconds: 540,
              ), () {
            _notificationDataController.load(notificationDataPlace,
                _notificationPlaceController.updatePlaceLoading);
          });
        }
      });

      List<Item> itemData = _notificationDataController
          .getNotificationDataPlace(notificationDataPlace);

      return RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
                const Duration(
                  milliseconds: 540,
                ), () {
              _notificationDataController.updatePlaceIndex(1);
            });
          },
          child: ListView.builder(
              itemCount: itemData.length + 1,
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (itemData.length == index) {
                  return Obx(() {
                    return (_notificationPlaceController.placeLoading.value)
                        ? const Card(
                            child: Center(child: CircularProgressIndicator()))
                        : const SizedBox();
                  });
                } else {
                  Item item = itemData[index];

                  return NotificationItem(
                      item: item,
                      updateStatusNotificationData: () {
                        if ("unread" == item.getItemStatus()) {
                          _notificationDataController
                              .updateStatusNotificationData(
                                  item.getItemId(), "read");
                        } else {
                          _notificationDataController
                              .updateStatusNotificationData(
                                  item.getItemId(), "unread");
                        }
                      },
                      placeValue:
                          _notificationPlaceController.placeInputValue.value);
                }
              }));
    });
  }
}
