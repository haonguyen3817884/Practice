import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import "package:store_project/screens/ageScreen/age_screen_controller.dart";
import "package:store_project/widgets/button.dart";
import "package:store_project/routes/route_name.dart";

import "package:store_project/widgets/text_simple.dart";

class AgeInputPlace extends GetView<AgeScreenController> {
  const AgeInputPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          child: const TextSimple(
              textValue: "place place place place place place place"),
          margin: const EdgeInsets.only(top: 7.4, bottom: 0)),
      Container(
          child: const TextSimple(textValue: "place place place place"),
          margin: const EdgeInsets.only(top: 0, bottom: 7.4)),
      Obx(() {
        return NumberPicker(
            value: controller.ageValue.value,
            minValue: 0,
            maxValue: 100,
            step: 1,
            itemHeight: 100,
            itemWidth: 54,
            itemCount: 5,
            axis: Axis.horizontal,
            onChanged: (value) => controller.updateAgeValue(value),
            selectedTextStyle: const TextStyle(
                color: Color.fromARGB(255, 98, 98, 98), fontSize: 27.4),
            textStyle: const TextStyle(
                color: Color.fromARGB(255, 98, 98, 98), fontSize: 27.4));
      }),
      const SizedBox(height: 74.0),
      Button(
          text: "place",
          buttonAction: () {
            controller.placeIn(RouteName.confirmPlace, data: {
              "title": "place place place place place",
              "texts": [
                "place place place place",
                "place place place place place",
                "place place place place"
              ],
              "action": () {
                final ageController = Get.put(AgeScreenController());

                ageController.saveAge();
                ageController.placeIn(RouteName.placePlace);
              }
            });
          })
    ]);
  }
}
