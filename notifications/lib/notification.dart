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
  String _placeName = "place";

  double _inputTextSize = 74;

  final _value = TextEditingController();

  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();

    notificationController.getNotificationData(widget.notificationData);
  }

  void _updatePlaceName(String placeName) {
    setState(() {
      _placeName = placeName;
    });
  }

  void _updateInputTextSize(double size) {
    setState(() {
      _inputTextSize = size;
    });
  }

  Widget _placeWidget(Function updatePlace) {
    return SizedBox(
        child: IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              updatePlace("placeInput");
            }));
  }

  Widget _placeInputWidget(
      Function updatePlace, double inputFormSize, Function updateSize) {
    Future.delayed(const Duration(milliseconds: 800), () {
      updateSize(274.0);
    });

    return AnimatedSize(
        duration: const Duration(milliseconds: 400),
        child: Container(
            child: TextFormField(
                controller: _value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _value.clear();
                        }),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(43)),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(Icons.search),
                    fillColor: const Color(0xFFF5F5F5),
                    filled: true)),
            margin:
                const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 7.4),
            width: inputFormSize));
  }

  Widget _placeIconWidget(Function updatePlace, Function updateSize) {
    return SizedBox(
        child: IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 28),
            onPressed: () {
              updatePlace("place");
              updateSize(74.0);
            }));
  }

  Widget _placeTextWidget(String text) {
    return Text(text,
        style: const TextStyle(color: Colors.black, fontSize: 28));
  }

  Widget _renderPlaceWidgets(String text) {
    return ("placeInput" == _placeName)
        ? _placeIconWidget(_updatePlaceName, _updateInputTextSize)
        : _placeTextWidget(text);
  }

  Widget _renderWidgets(double inputFormSize) {
    return ("placeInput" == _placeName)
        ? _placeInputWidget(
            _updatePlaceName, inputFormSize, _updateInputTextSize)
        : _placeWidget(_updatePlaceName);
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
                  child: _renderWidgets(_inputTextSize))
            ],
            backgroundColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0.0),
        body: NotificationItems(value: _value.text),
        backgroundColor: const Color(0xFFFFFFFF));
  }
}
