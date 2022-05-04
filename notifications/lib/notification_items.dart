import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import "package:notifications/notification_controller.dart";

class NotificationItems extends StatefulWidget {
  const NotificationItems({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  State<NotificationItems> createState() => _NotificationItemsState();
}

class _NotificationItemsState extends State<NotificationItems> {
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
  }

  Widget _notificationItem(
      String itemMessage,
      String itemImage,
      String itemDate,
      Color itemColor,
      String itemCustomerName,
      String itemIcon,
      Function updateStatusNotificationItem) {
    return SizedBox(
        child: GestureDetector(
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 11, right: 15, left: 15, bottom: 11),
                    child: Row(children: <Widget>[
                      Stack(children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: Container(
                                width: 43,
                                height: 43,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(itemImage)),
                                    borderRadius: BorderRadius.circular(43)))),
                        Positioned(
                            bottom: 5.3,
                            right: 5.3,
                            child: Container(
                                width: 17.4,
                                height: 17.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(itemIcon)),
                                    borderRadius: BorderRadius.circular(43),
                                    border: Border.all(
                                        color: const Color(0xFFFFFFFF),
                                        width: 15.9,
                                        style: BorderStyle.solid))))
                      ]),
                      const SizedBox(width: 14),
                      SizedBox(
                          width: 276,
                          child: Column(children: <Widget>[
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: itemCustomerName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: itemMessage,
                                      style: const TextStyle(fontSize: 13.6))
                                ],
                              ),
                            ),
                            const SizedBox(height: 1.4),
                            Text(itemDate,
                                style: const TextStyle(
                                    fontSize: 11.5, color: Color(0xFF808080)))
                          ], crossAxisAlignment: CrossAxisAlignment.start))
                    ])),
                color: itemColor,
                elevation: 0.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onTap: () {
              updateStatusNotificationItem();
            }));
  }

  List<dynamic> _getNotificationDataPlace(
      List<dynamic> data, String placeValue) {
    List<dynamic> notificationDataPlace = [];

    for (int i = 0; i < data.length; ++i) {
      RegExp regExp = RegExp(placeValue);

      var itemInData = data[i];

      String itemMessage = itemInData["message"]["text"].split(":")[0];

      if (regExp.hasMatch(itemMessage)) {
        notificationDataPlace.add(data[i]);
      }
    }

    return notificationDataPlace;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        builder: (_notificationController) {
      List<dynamic> notificationDataPlace = _getNotificationDataPlace(
          _notificationController.notificationData, widget.value);

      return ListView.builder(
          itemCount: notificationDataPlace.length,
          itemBuilder: (context, index) {
            dynamic itemInData = notificationDataPlace[index];
            DateTime itemDateInData =
                DateTime.fromMillisecondsSinceEpoch(itemInData["receivedAt"]);

            DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");
            String itemDate = dateFormat.format(itemDateInData);
            String itemMessageInData = itemInData["message"]["text"];
            String itemCustomerName = itemInData["subjectName"];
            String itemMessagesInData =
                itemMessageInData.split(itemCustomerName)[1];
            String itemMessage = itemMessagesInData.split(":")[0];
            String itemStatus = itemInData["status"];
            String itemId = itemInData["id"];

            Color itemColor = ("unread" == itemStatus)
                ? const Color(0xFFECF7E7)
                : Colors.transparent;

            // ignore: prefer_function_declarations_over_variables
            Function updateStatusNotificationItem = () {
              if ("unread" == itemStatus) {
                notificationController.updateStatusNotificationData(
                    "read", itemId);
              } else {
                notificationController.updateStatusNotificationData(
                    "unread", itemId);
              }
            };

            String itemImage = itemInData["image"];

            String itemIcon = itemInData["icon"];

            return _notificationItem(
                itemMessage,
                itemImage,
                itemDate,
                itemColor,
                itemCustomerName,
                itemIcon,
                updateStatusNotificationItem);
          });
    });
  }
}
