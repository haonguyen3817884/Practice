import 'package:get/get.dart';

class NotificationPlaceController extends GetxController {
  var placeName = "placeNotification".obs;
  var placeInputTextSize = 74.0.obs;
  var placeInputValue = "".obs;

  var placeLoading = false.obs;

  void updatePlaceName(String text) {
    placeName.value = text;
  }

  void updatePlaceInputTextSize(double size) {
    placeInputTextSize.value = size;
  }

  void updatePlaceInputValue(String text) {
    placeInputValue.value = text;
  }

  void updatePlaceLoading(bool isLoading) {
    placeLoading.value = isLoading;
  }
}
