import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:notifications/models/notification_item.dart";

import "package:notifications/controllers/data_controller.dart";

import "package:notifications/controllers/place_controller.dart";
import 'package:loadany/loadany.dart';

import "package:notifications/places/body/item_place.dart";

import "package:notifications/notification_messages.dart";

class NotificationItems extends StatelessWidget {
  NotificationItems({Key? key}) : super(key: key);

  final NotificationDataController _notificationDataController =
      Get.put(NotificationDataController());

  final NotificationPlaceController _notificationPlaceController =
      Get.put(NotificationPlaceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Item> notificationDataOnCustomerInputs =
          _notificationDataController.getNotificationDataOnCustomerInputs(
              _notificationPlaceController.placeInputValue.value);

      List<Item> itemData = _notificationDataController
          .getNotificationDataPlace(notificationDataOnCustomerInputs);

      return RefreshIndicator(
          onRefresh: () {
            return _notificationDataController.refreshNotificationData();
          },
          child: LoadAny(
            onLoadMore: () {
              return _notificationDataController
                  .loadItems(notificationDataOnCustomerInputs);
            },
            status: _notificationDataController.loadingStatus.value,
            loadingMsg: loadingNormal,
            errorMsg: loadingError,
            finishMsg: loadingFinished,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Item item = itemData[index];
                      return NotificationItem(item: item);
                    },
                    childCount: (itemData.length),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
