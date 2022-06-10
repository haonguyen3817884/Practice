import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loadany/loadany.dart';
import "package:notifications/controllers/place_controller.dart";

import "package:notifications/controllers/data_controller.dart";

class NotificationTitlePlace extends GetView<NotificationPlaceController> {
  NotificationTitlePlace({Key? key, required this.title}) : super(key: key);

  final String title;

  final NotificationDataController _notificationDataController =
      Get.put(NotificationDataController());

  Widget _placeTextWidget(String text) {
    return Text(text,
        style: const TextStyle(color: Colors.black, fontSize: 28));
  }

  Widget _placeIconWidget() {
    return SizedBox(
        child: IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 28),
            onPressed: () {
              controller.updatePlaceName("placeNotification");
              controller.updatePlaceInputTextSize(74.0);
              controller.updatePlaceInputValue("");
              _notificationDataController.updatePlaceIndex(1);
              _notificationDataController
                  .updateLoadingStatus(LoadStatus.normal);
            }));
  }

  Widget _renderTitleWidgets(String text) {
    return Obx(() {
      return (controller.isPlaceInput())
          ? _placeIconWidget()
          : _placeTextWidget(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: _renderTitleWidgets(title));
  }
}
