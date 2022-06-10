import 'package:get/get.dart';
import "package:store_project/place/place_controller.dart";

import 'package:flutter/material.dart';
import "package:store_project/widgets/text_simple.dart";

class ConfirmScreenController extends PlaceController {
  dynamic data = Get.arguments;

  Widget getTitle() {
    return TextSimple(
        textValue: data["title"],
        textColor: Color(0xFFFFFFFF),
        textFontWeight: FontWeight.bold,
        textFontSize: 17.4);
  }

  List<Widget> getTexts() {
    List<Widget> texts = <Widget>[];

    for (int i = 0; i < data["texts"].length; ++i) {
      Widget text = Container(
          child: TextSimple(textValue: data["texts"][i]),
          margin: EdgeInsets.only(top: 7.4, bottom: 7.4));

      texts.add(text);
    }

    return texts;
  }

  void getAction() {
    Function action = data["action"];

    action();
  }
}
