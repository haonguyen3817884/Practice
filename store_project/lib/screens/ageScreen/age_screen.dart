import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import "package:store_project/widgets/text_logo.dart";
import "package:store_project/widgets/age_text_place.dart";

import "package:store_project/widgets/age_input_place.dart";

import "package:store_project/screens/ageScreen/age_screen_controller.dart";

class AgeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgeScreenController());
  }
}

class AgeScreen extends GetView<AgeScreenController> {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            backgroundColor: Colors.transparent),
        body: Center(
            child: Column(children: <Widget>[
          Container(
              child: const TextLogo(),
              margin:
                  const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 74)),
          const SizedBox(
              child: Divider(
                  color: Color.fromARGB(255, 98, 98, 98), thickness: 0.8),
              width: 148.0),
          Expanded(child: Obx(() {
            return (controller.isText.value)
                ? const AgeTextPlace()
                : const AgeInputPlace();
          }))
        ])),
        backgroundColor: Colors.black);
  }
}
