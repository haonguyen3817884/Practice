import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<dynamic> notificationData = [].obs;

  void getNotificationData(List<dynamic> data) {
    notificationData = data;
  }

  void updateStatusNotificationData(String itemStatus, String itemId) {
    for (int i = 0; i < notificationData.length; ++i) {
      dynamic itemInData = notificationData[i];
      if (itemId == itemInData["id"]) {
        notificationData[i]["status"] = itemStatus;
      }
    }

    update();
  }
}
