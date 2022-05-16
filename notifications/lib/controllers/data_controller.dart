import 'package:get/get.dart';

import "package:notifications/models/item.dart";

class NotificationDataController extends GetxController {
  List<Item> notificationData = <Item>[].obs;
  var index = 1.obs;

  void setNotificationData(List<dynamic> data) {
    List<Item> itemData = <Item>[].obs;

    for (int i = 0; i < data.length; ++i) {
      dynamic itemInData = data[i];

      Item item = Item(
          itemId: itemInData["id"],
          itemType: itemInData["type"],
          itemTitle: itemInData["title"],
          itemMessage: itemInData["message"],
          itemImage: itemInData["image"],
          itemIcon: itemInData["icon"],
          itemStatus: itemInData["status"],
          itemSubscription: itemInData["subscription"],
          itemReadAt: itemInData["readAt"],
          itemCreatedAt: itemInData["createdAt"],
          itemReceivedAt: itemInData["receivedAt"],
          itemUpdatedAt: itemInData["updatedAt"],
          itemImageThumb: itemInData["imageThumb"],
          itemAnimation: itemInData["animation"],
          itemTracking: itemInData["tracking"],
          itemSubjectName: itemInData["subjectName"],
          isItemSubscribed: itemInData["isSubscribed"]);

      itemData.add(item);
    }

    notificationData = itemData;
  }

  void updateStatusNotificationData(String itemId, String itemStatus) {
    for (int i = 0; i < notificationData.length; ++i) {
      Item item = notificationData[i];
      if (itemId == item.getItemId()) {
        item.setItemStatus(itemStatus);
      }

      notificationData[i] = item;
    }
  }

  void updateIndex(List<Item> data) {
    if (data.length >= (index.value + 1) * 11) {
      index.value = index.value + 1;
    } else {
      if (data.length > index.value * 11) {
        index.value = index.value + 1;
      }
    }
  }

  void updatePlaceIndex(int place) {
    index.value = place;
  }

  List<Item> getNotificationDataPlace(List<Item> data) {
    List<Item> notificationDataPlace = <Item>[];
    int dataLength = 0;

    if (data.length >= index.value * 11) {
      dataLength = index.value * 11;
    } else {
      dataLength = data.length;
    }

    for (int i = 0; i < dataLength; ++i) {
      Item item = data[i];

      notificationDataPlace.add(item);
    }

    return notificationDataPlace;
  }

  void load(List<Item> data, Function updateLoading) {
    updateLoading(false);
    updateIndex(data);
  }
}
