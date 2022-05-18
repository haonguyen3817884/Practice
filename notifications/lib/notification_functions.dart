String removePlaceCharacters(String str) {
  str = str
      .replaceAll(RegExp("à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ"), "a")
      .replaceAll(RegExp("è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ"), "e")
      .replaceAll(RegExp("ì|í|ị|ỉ|ĩ"), "i")
      .replaceAll(RegExp("ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ"), "o")
      .replaceAll(RegExp("ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ"), "u")
      .replaceAll(RegExp("ỳ|ý|ỵ|ỷ|ỹ"), "y")
      .replaceAll(RegExp("đ"), "d")
      .replaceAll(RegExp("\u0300|\u0301|\u0303|\u0309|\u0323"), "")
      .replaceAll(RegExp("\u02C6|\u0306|\u031B"), "");
  return str;
}

List<dynamic> getHighlightPlaces(String message, String placeValue) {
  List<dynamic> places = [];

  String replacedPlaceValue = "";
  int index = 0;
  String placeMessage = "";

  placeMessage = removePlaceCharacters(message).toLowerCase();

  index = placeMessage.indexOf(removePlaceCharacters(placeValue).toLowerCase());

  if ("" != placeValue) {
    for (int i = 0; i < placeValue.length; ++i) {
      replacedPlaceValue = replacedPlaceValue + " ";
    }

    while (-1 != index) {
      dynamic place = {};
      place["offset"] = index;

      place["length"] = placeValue.length;

      places.add(place);

      placeMessage = placeMessage.replaceFirst(
          RegExp(removePlaceCharacters(placeValue).toLowerCase()),
          replacedPlaceValue);

      index =
          placeMessage.indexOf(removePlaceCharacters(placeValue).toLowerCase());
    }
  }

  return places;
}
