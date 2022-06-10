import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:store_project/config/constant_values.dart";

class PlaceImage extends StatelessWidget {
  const PlaceImage({Key? key, required this.places}) : super(key: key);

  final List<String> places;

  List<Widget> getPlaces() {
    List<Widget> placeArr = <Widget>[];

    for (int i = 0; i < places.length; ++i) {
      Widget place = SizedBox(
          child: ClipRRect(
              child: Image.network(places[i], loadingBuilder:
                      (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
                  cacheWidth: Get.width ~/ ConstantValues.maxItemsInOneLine,
                  cacheHeight:
                      Get.height ~/ ConstantValues.maxItemsInOneLine)));

      placeArr.add(place);
    }

    return placeArr;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: getPlaces());
  }
}
