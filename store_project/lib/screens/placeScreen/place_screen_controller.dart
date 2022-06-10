import 'package:get/get.dart';
import 'package:loadany/loadany.dart';
import "package:store_project/place/place_controller.dart";

import "package:store_project/sample_data.dart";
import "package:store_project/config/place_place.dart";
import "package:store_project/config/constant_values.dart";

class PlaceScreenController extends PlaceController {
  var isButtonOn = false.obs;

  var customerTitle = "".obs;

  List<dynamic> placeData = [].obs;

  var index = 1.obs;

  var loadStatus = LoadStatus.normal.obs;

  void updateIsButtonOn(bool value) {
    isButtonOn.value = value;
  }

  void updateCustomerTitle(String title) {
    customerTitle.value = title;
  }

  void updateIndex(int indexValue) {
    index.value = indexValue;
  }

  void updateLoadStatus(LoadStatus placeStatus) {
    loadStatus.value = placeStatus;
  }

  void setPlaceData(List<dynamic> data) {
    for (int i = 0; i < data.length; ++i) {
      dynamic itemInData = data[i];
      placeData.add(itemInData);
    }
  }

  Future<void> getRefresh() async {
    return await Future.delayed(Duration(milliseconds: 400), () {
      updateIndex(1);

      updateLoadStatus(LoadStatus.normal);
    });
  }

  Future<void> getLoadMore() async {
    updateLoadStatus(LoadStatus.loading);

    return await Future.delayed(Duration(milliseconds: 5000), () {
      if (isIndexIn(
          index.value + 1, ConstantValues.maxItems, getDataByTitle().length)) {
        updateLoadStatus(LoadStatus.normal);

        updateIndex(index.value + 1);
      } else {
        updateLoadStatus(LoadStatus.completed);
      }
    });
  }

  List<String> getDataByTitle() {
    List<String> places = <String>[];

    for (int i = 0; i < placeData.length; ++i) {
      if (customerTitle.value == placeData[i]["title"]) {
        places = List.from(placeData[i]["places"]);
      }
    }

    return places;
  }

  @override
  void onReady() {
    super.onReady();

    setPlaceData(getData()["data"]);
  }
}
