String removePlaceCharacters(String str) {
  str = str.replaceAll(RegExp("à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ"), "a");
  str = str.replaceAll(RegExp("è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ"), "e");
  str = str.replaceAll(RegExp("ì|í|ị|ỉ|ĩ"), "i");
  str = str.replaceAll(RegExp("ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ"), "o");
  str = str.replaceAll(RegExp("ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ"), "u");
  str = str.replaceAll(RegExp("ỳ|ý|ỵ|ỷ|ỹ"), "y");
  str = str.replaceAll(RegExp("đ"), "d");
  // Some system encode vietnamese combining accent as individual utf-8 characters
  str = str.replaceAll(RegExp("\u0300|\u0301|\u0303|\u0309|\u0323"),
      ""); // Huyền sắc hỏi ngã nặng
  str = str.replaceAll(RegExp("\u02C6|\u0306|\u031B"), "");
  return str;
}
