import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import "package:notifications/notification_items.dart";

import "package:notifications/notification_controller.dart";

class NotificationPlace extends StatefulWidget {
  const NotificationPlace(
      {Key? key, required this.title, required this.notificationData})
      : super(key: key);

  final String title;

  final List<dynamic> notificationData;

  @override
  State<NotificationPlace> createState() => _NotificationPlaceState();
}

class _NotificationPlaceState extends State<NotificationPlace>
    with TickerProviderStateMixin {
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();

    notificationController.getNotificationData(widget.notificationData);
  }

  Widget _placeWidget(Function updatePlace, Function updateValue) {
    return SizedBox(
        child: IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              updatePlace("placeInput");

              updateValue("");
            }));
  }

  Widget _placeInputWidget(double inputFormSize, Function updateSize) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      updateSize(274.0);
    });

    return AnimatedSize(
        duration: const Duration(milliseconds: 400),
        child: Container(
            child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          notificationController.updateValue("");
                        }),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(43)),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(Icons.search),
                    fillColor: const Color(0xFFF5F5F5),
                    filled: true),
                onChanged: (value) {
                  notificationController.updateValue(value);
                }),
            margin:
                const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 7.4),
            width: inputFormSize));
  }

  Widget _placeIconWidget(
      Function updatePlace, Function updateSize, Function updateValue) {
    return SizedBox(
        child: IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 28),
            onPressed: () {
              updatePlace("placeNotification");

              updateSize(74.0);

              updateValue("");
            }));
  }

  Widget _placeTextWidget(String text) {
    return Text(text,
        style: const TextStyle(color: Colors.black, fontSize: 28));
  }

  Widget _renderPlaceWidgets(String text) {
    return Obx(() {
      return ("placeInput" == notificationController.placeName.value)
          ? _placeIconWidget(
              notificationController.updatePlaceName,
              notificationController.updateSize,
              notificationController.updateValue)
          : _placeTextWidget(text);
    });
  }

  Widget _renderWidgets() {
    return Obx(() {
      return ("placeInput" == notificationController.placeName.value)
          ? _placeInputWidget(notificationController.inputTextSize.value,
              notificationController.updateSize)
          : _placeWidget(notificationController.updatePlaceName,
              notificationController.updateValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _renderPlaceWidgets(widget.title)),
            actions: <Widget>[
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: _renderWidgets())
            ],
            backgroundColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0.0,
            centerTitle: false),
        body: const NotificationItems(),
        backgroundColor: const Color(0xFFFFFFFF));
  }
}
