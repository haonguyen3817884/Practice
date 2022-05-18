import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:notifications/controllers/place_controller.dart";

class NotificationTitlePlace extends StatelessWidget {
  NotificationTitlePlace({Key? key, required this.title}) : super(key: key);

  final String title;

  final NotificationPlaceController _notificationPlaceController =
      Get.put(NotificationPlaceController());

  Widget _placeTextWidget(String text) {
    return Text(text,
        style: const TextStyle(color: Colors.black, fontSize: 28));
  }

  Widget _placeIconWidget() {
    return SizedBox(
        child: IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 28),
            onPressed: () {
              _notificationPlaceController.updatePlaceName("placeNotification");
              _notificationPlaceController.updatePlaceInputTextSize(74.0);
              _notificationPlaceController.updatePlaceInputValue("");
            }));
  }

  Widget _renderTitleWidgets(String text) {
    return Obx(() {
      return (_notificationPlaceController.isPlaceInput())
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
