import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:notifications/controllers/place_controller.dart";

import "package:notifications/controllers/data_controller.dart";

class NotificationActionsPlace extends StatelessWidget {
  NotificationActionsPlace({Key? key}) : super(key: key);

  final TextEditingController _textController = TextEditingController();

  final NotificationPlaceController _notificationPlaceController =
      Get.put(NotificationPlaceController());

  final NotificationDataController _notificationDataController =
      Get.put(NotificationDataController());

  Widget _placeInputWidget(double inputFormSize) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _notificationPlaceController.updatePlaceInputTextSize(274.0);
    });

    return AnimatedSize(
        duration: const Duration(milliseconds: 400),
        child: Container(
            child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          _textController.clear();
                        }),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(43)),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(Icons.search),
                    fillColor: const Color(0xFFF5F5F5),
                    filled: true),
                controller: _textController),
            margin:
                const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 7.4),
            width: inputFormSize));
  }

  Widget _placeIconWidget() {
    return SizedBox(
        child: IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              _notificationPlaceController.updatePlaceName("placeInput");

              _notificationPlaceController.updatePlaceInputValue("");
            }));
  }

  Widget _renderActionsWidgets() {
    return Obx(() {
      return (_notificationPlaceController.isPlaceInput())
          ? _placeInputWidget(
              _notificationPlaceController.placeInputTextSize.value)
          : _placeIconWidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    _textController.addListener(() {
      _notificationPlaceController.updatePlaceInputValue(_textController.text);

      _notificationDataController.updatePlaceIndex(1);
    });

    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: _renderActionsWidgets());
  }
}
