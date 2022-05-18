import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:notifications/models/item.dart";

import "package:notifications/controllers/data_controller.dart";

import "package:notifications/controllers/place_controller.dart";
import 'package:loadany/loadany.dart';

import "package:notifications/places/body/item_place.dart";

// ignore: must_be_immutable
class NotificationItems extends StatelessWidget {
  const NotificationItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationDataController _notificationDataController =
        Get.put(NotificationDataController());

    final NotificationPlaceController _notificationPlaceController =
        Get.put(NotificationPlaceController());

    return Obx(() {
      List<Item> notificationDataOnCustomerInputs =
          _notificationDataController.getNotificationDataOnCustomerInputs(
              _notificationPlaceController.placeInputValue.value);

      List<Item> itemData = _notificationDataController
          .getNotificationDataPlace(notificationDataOnCustomerInputs);

      Future<void> getLoadMore() async {
        _notificationDataController.updateLoadingStatus(LoadStatus.loading);
        Timer.periodic(const Duration(milliseconds: 5000), (Timer timer) {
          timer.cancel();

          _notificationDataController
              .updateIndex(notificationDataOnCustomerInputs);

          if (itemData.length ==
              _notificationDataController.notificationData.length) {
            _notificationDataController
                .updateLoadingStatus(LoadStatus.completed);
          } else {
            _notificationDataController
                .updateIndex(notificationDataOnCustomerInputs);
            _notificationDataController.updateLoadingStatus(LoadStatus.normal);
          }
        });
      }

      return RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
                const Duration(
                  milliseconds: 540,
                ), () {
              _notificationDataController.updatePlaceIndex(1);
            });
          },
          child: LoadAny(
            onLoadMore: getLoadMore,
            status: _notificationDataController.loadingStatus.value,
            loadingMsg: 'loading',
            errorMsg: 'error',
            finishMsg: 'place',
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
