import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NotificationController extends GetxController {
  List<dynamic> notificationData = [].obs;

  var placeName = "placeNotification".obs;
  var inputTextSize = 74.0.obs;
  var value = "".obs;

  void getNotificationData(List<dynamic> data) {
    notificationData = data.obs;
  }

  void updateStatusNotificationData(String itemStatus, String itemId) {
    for (int i = 0; i < notificationData.length; ++i) {
      dynamic itemInData = notificationData[i];
      if (itemId == itemInData["id"]) {
        itemInData["status"] = itemStatus;

        notificationData[i] = itemInData;
      }
    }
  }

  void updatePlaceName(String place) {
    placeName.value = place;
  }

  void updateSize(double inputSize) {
    inputTextSize.value = inputSize;
  }

  void updateValue(String textValue) {
    value.value = textValue;
  }

  String getItemDate(int milliseconds) {
    DateTime itemDate =
        DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);

    DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");

    return dateFormat.format(itemDate);
  }

  Color getItemColor(String itemStatus, Color itemColor1, Color itemColor2) {
    return ("unread" == itemStatus) ? itemColor1 : itemColor2;
  }
}
