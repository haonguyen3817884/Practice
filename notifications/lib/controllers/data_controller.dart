import 'package:get/get.dart';
import 'package:loadany/loadany.dart';

import "package:notifications/models/notification_item.dart";

import "package:notifications/notification_functions.dart";

import "package:notifications/notification_data.dart";

class NotificationDataController extends GetxController {
  List<Item> notificationData = <Item>[].obs;

  var index = 1.obs;
  final maxItems = 11;

  var isLastItems = false.obs;
  var loadingStatus = LoadStatus.normal.obs;

  void setNotificationData(List<dynamic> data) {
    List<Item> itemData = <Item>[].obs;

    for (int i = 0; i < data.length; ++i) {
      dynamic itemInData = data[i];

      Item item = Item.fromJson(itemInData);

      itemData.add(item);
    }

    notificationData = itemData;
  }

  void updateStatusNotificationData(String itemId) {
    int notificationDataIndex = notificationData
        .indexWhere((notificationItem) => itemId == notificationItem.id);
    Item item = notificationData[notificationDataIndex];

    (item.isUnread()) ? item.status = "read" : item.status = "unread";

    notificationData[notificationDataIndex] = item;
  }

  void updateIndex(List<Item> data) {
    if (data.length >= (index.value + 1) * maxItems) {
      index.value = index.value + 1;
    } else {
      if (data.length > index.value * maxItems) {
        index.value = index.value + 1;
      }
    }
  }

  void updatePlaceIndex(int place) {
    index.value = place;
  }

  void updateIsLastItems(bool isLast) {
    isLastItems.value = isLast;
  }

  void updateLoadingStatus(LoadStatus status) {
    loadingStatus.value = status;
  }

  List<Item> getNotificationDataPlace(List<Item> data) {
    List<Item> notificationDataPlace = <Item>[];
    int dataLength = 0;

    if (data.length >= index.value * maxItems) {
      dataLength = index.value * maxItems;
    } else {
      dataLength = data.length;
    }

    for (int i = 0; i < dataLength; ++i) {
      Item item = data[i];

      notificationDataPlace.add(item);
    }

    return notificationDataPlace;
  }

  List<Item> getNotificationDataOnCustomerInputs(String customerValue) {
    List<Item> notificationDataPlace = <Item>[];
    RegExp regExp = RegExp(removePlaceCharacters(customerValue).toLowerCase());

    for (int i = 0; i < notificationData.length; ++i) {
      Item itemInData = notificationData[i];
      String itemMessage = itemInData.message["text"].split(":")[0];
      if (regExp.hasMatch(removePlaceCharacters(itemMessage).toLowerCase())) {
        notificationDataPlace.add(itemInData);
      }
    }
    return notificationDataPlace;
  }

  Future<void> refreshNotificationData() async {
    return Future.delayed(const Duration(milliseconds: 540), () {
      updatePlaceIndex(1);

      updateLoadingStatus(LoadStatus.normal);
    });
  }

  Future<void> loadItems(List<Item> data) async {
    updateLoadingStatus(LoadStatus.loading);
    return Future.delayed(const Duration(milliseconds: 5000), () {
      if (index.value * maxItems >= data.length) {
        updateLoadingStatus(LoadStatus.completed);
      } else {
        updateIndex(data);
        updateLoadingStatus(LoadStatus.normal);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();

    setNotificationData(getData()["data"]);

    updateLoadingStatus(LoadStatus.normal);
  }
}
