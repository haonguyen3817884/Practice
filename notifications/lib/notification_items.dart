import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:notifications/notification_controller.dart";
import "package:notifications/notification_functions.dart";

class NotificationItems extends StatelessWidget {
  const NotificationItems({Key? key}) : super(key: key);

  List<TextSpan> _getMessageWidgets(String itemMessage, List<dynamic> places) {
    List<TextSpan> textPlaces = <TextSpan>[];

    String itemMessages = "";
    int itemPlace = 0;
    for (int i = 0; i < places.length; ++i) {
      dynamic place = places[i];
      if ((places.length - 1) == i) {
        if (itemPlace != place["offset"]) {
          itemMessages = itemMessage.substring(itemPlace, place["offset"]);

          textPlaces.add(_getTextWidget(itemMessages));
        }

        itemMessages = itemMessage.substring(
            place["offset"], place["offset"] + place["length"]);

        textPlaces
            .add(_getTextWidget(itemMessages, textFontWeight: FontWeight.bold));

        if (itemMessage.length - 1 != place["offset"] + place["length"]) {
          itemMessages = itemMessage.substring(
              place["offset"] + place["length"], itemMessage.length);

          textPlaces.add(_getTextWidget(itemMessages));
        }
      } else {
        if (itemPlace != place["offset"]) {
          itemMessages = itemMessage.substring(itemPlace, place["offset"]);

          textPlaces.add(_getTextWidget(itemMessages));
        }

        itemMessages = itemMessage.substring(
            place["offset"], place["offset"] + place["length"]);

        textPlaces
            .add(_getTextWidget(itemMessages, textFontWeight: FontWeight.bold));

        itemPlace = place["offset"] + place["length"];
      }
    }

    return textPlaces;
  }

  TextSpan _getTextWidget(String text,
      {FontWeight textFontWeight = FontWeight.normal}) {
    return TextSpan(
        text: text,
        style: TextStyle(fontSize: 13.6, fontWeight: textFontWeight));
  }

  Widget _notificationItem(
      String itemMessage,
      String itemImage,
      String itemDate,
      Color itemColor,
      String itemIcon,
      Function updateStatusNotificationItem,
      List<dynamic> places,
      String placeValue) {
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
                            child: SizedBox(
                                width: 43,
                                height: 43,
                                child: ClipRRect(
                                    child: Image.network(itemImage,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                      if (null == loadingProgress) {
                                        return child;
                                      }

                                      return const Center(
                                          child: CircularProgressIndicator(
                                              value: null));
                                    }),
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
                                  children: _getTextPlacesWidgets(
                                      placeValue, itemMessage, places)),
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
      RegExp regExp = RegExp(placeValue.toLowerCase());

      var itemInData = data[i];

      String itemMessage = itemInData["message"]["text"].split(":")[0];

      if (regExp.hasMatch(removePlaceCharacters(itemMessage).toLowerCase())) {
        notificationDataPlace.add(data[i]);
      }
    }

    return notificationDataPlace;
  }

  List<TextSpan> _getMessagePlaceWidgets(
      String itemMessage, String placeValue) {
    List<TextSpan> textPlaces = [];

    int index = removePlaceCharacters(itemMessage)
        .toLowerCase()
        .indexOf(placeValue.toLowerCase());

    List<String> itemMessages = itemMessage
        .split(itemMessage.substring(index, index + placeValue.length));

    for (int i = 0; i < itemMessages.length; ++i) {
      if (itemMessages.length - 1 == i) {
        textPlaces.add(_getTextWidget(itemMessages[i]));
      } else {
        textPlaces.add(_getTextWidget(itemMessages[i]));
        textPlaces.add(_getTextWidget(
            itemMessage.substring(index, index + placeValue.length),
            textFontWeight: FontWeight.bold));
      }
    }

    return textPlaces;
  }

  List<TextSpan> _getTextPlacesWidgets(
      String placeValue, String itemMessage, List<dynamic> places) {
    return ("" == placeValue)
        ? _getMessageWidgets(itemMessage, places)
        : _getMessagePlaceWidgets(itemMessage, placeValue);
  }

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController =
        Get.put(NotificationController());

    return Obx(() {
      List<dynamic> notificationDataPlace = _getNotificationDataPlace(
          notificationController.notificationData,
          notificationController.value.value);

      return ListView.builder(
          itemCount: notificationDataPlace.length,
          itemBuilder: (context, index) {
            dynamic itemInData = notificationDataPlace[index];

            return _notificationItem(
                itemInData["message"]["text"].split(":")[0],
                itemInData["image"],
                notificationController.getItemDate(itemInData["receivedAt"]),
                notificationController.getItemColor(itemInData["status"],
                    Color(0xFFECF7E7), Colors.transparent),
                itemInData["icon"],
                ("unread" == itemInData["status"])
                    ? () {
                        notificationController.updateStatusNotificationData(
                            "read", itemInData["id"]);
                      }
                    : () {
                        notificationController.updateStatusNotificationData(
                            "unread", itemInData["id"]);
                      },
                itemInData["message"]["highlights"],
                notificationController.value.value);
          });
    });
  }
}
