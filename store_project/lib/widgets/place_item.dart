import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loadany/loadany.dart';

import "package:store_project/widgets/text_simple.dart";

import "package:store_project/screens/placeScreen/place_screen_controller.dart";

class PlaceItem extends GetView<PlaceScreenController> {
  const PlaceItem({Key? key, required this.textValue, required this.isIn})
      : super(key: key);

  final String textValue;

  final bool isIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            child: TextSimple(
                textValue: textValue,
                textFontWeight: (isIn) ? FontWeight.w500 : FontWeight.normal),
            padding: EdgeInsets.all(17.4),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        style: (isIn) ? BorderStyle.solid : BorderStyle.none,
                        color: Color(0xFFFFFFFF),
                        width: 1.5)))),
        onTap: () {
          controller.updateIndex(1);

          controller.updateLoadStatus(LoadStatus.normal);

          controller.updateCustomerTitle(textValue);
        });
  }
}
