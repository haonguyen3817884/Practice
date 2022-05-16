import 'package:intl/intl.dart';

class Item {
  String _itemId = "";
  String _itemType = "";
  String _itemTitle = "";
  dynamic _itemMessage = {"text": "", "highlights": []};
  String _itemImage = "";
  String _itemIcon = "";
  String _itemStatus = "";
  dynamic _itemSubscription = {
    "targetId": "",
    "targetName": "",
    "targetType": "",
    "level": 0
  };
  int _itemReadAt = 0;
  int _itemCreatedAt = 0;
  int _itemReceivedAt = 0;
  int _itemUpdatedAt = 0;
  String _itemImageThumb = "";
  String _itemAnimation = "";
  dynamic _itemTracking = {};
  String _itemSubjectName = "";
  bool _isItemSubscribed = false;

  String getItemId() {
    return _itemId;
  }

  void setItemId(String itemId) {
    _itemId = itemId;
  }

  String getItemType() {
    return _itemType;
  }

  void setItemType(String itemType) {
    _itemType = itemType;
  }

  String getItemTitle() {
    return _itemTitle;
  }

  void setItemTitle(String itemTitle) {
    _itemTitle = itemTitle;
  }

  dynamic getItemMessage() {
    return _itemMessage;
  }

  void setItemMessage(dynamic itemMessage) {
    _itemMessage = itemMessage;
  }

  String getItemImage() {
    return _itemImage;
  }

  void setItemImage(String itemImage) {
    _itemImage = itemImage;
  }

  String getItemIcon() {
    return _itemIcon;
  }

  void setItemIcon(String itemIcon) {
    _itemIcon = itemIcon;
  }

  String getItemStatus() {
    return _itemStatus;
  }

  void setItemStatus(String itemStatus) {
    _itemStatus = itemStatus;
  }

  dynamic getItemSubscription() {
    return _itemSubscription;
  }

  void setItemSubscription(dynamic itemSubscription) {
    _itemSubscription = itemSubscription;
  }

  int getItemReadAt() {
    return _itemReadAt;
  }

  void setItemReadAt(int itemReadAt) {
    _itemReadAt = itemReadAt;
  }

  int getItemCreatedAt() {
    return _itemCreatedAt;
  }

  void setItemCreatedAt(int itemCreatedAt) {
    _itemCreatedAt = itemCreatedAt;
  }

  int getItemReceivedAt() {
    return _itemReceivedAt;
  }

  void setItemReceivedAt(int itemReceivedAt) {
    _itemReceivedAt = itemReceivedAt;
  }

  int getItemUpdatedAt() {
    return _itemUpdatedAt;
  }

  void setItemUpdatedAt(int itemUpdatedAt) {
    _itemUpdatedAt = itemUpdatedAt;
  }

  String getItemImageThumb() {
    return _itemImageThumb;
  }

  void setItemImageThumb(String itemImageThumb) {
    _itemImageThumb = itemImageThumb;
  }

  String getItemAnimation() {
    return _itemAnimation;
  }

  void setItemAnimation(String itemAnimation) {
    _itemAnimation = itemAnimation;
  }

  dynamic getItemTracking() {
    return _itemTracking;
  }

  void setItemTracking(dynamic itemTracking) {
    _itemTracking = itemTracking;
  }

  String getItemSubjectName() {
    return _itemSubjectName;
  }

  void setItemSubjectName(String itemSubjectName) {
    _itemSubjectName = itemSubjectName;
  }

  bool getIsItemSubscribed() {
    return _isItemSubscribed;
  }

  void setIsItemSubscribed(bool isItemSubscribed) {
    _isItemSubscribed = isItemSubscribed;
  }

  static String getItemDate(int milliseconds) {
    DateTime itemDate =
        DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");
    return dateFormat.format(itemDate);
  }

  Item(
      {String itemId = "",
      String itemType = "",
      String itemTitle = "",
      dynamic itemMessage,
      String itemImage = "",
      String itemIcon = "",
      String itemStatus = "",
      dynamic itemSubscription,
      int itemReadAt = 0,
      int itemCreatedAt = 0,
      int itemReceivedAt = 0,
      int itemUpdatedAt = 0,
      String itemImageThumb = "",
      String itemAnimation = "",
      dynamic itemTracking,
      String itemSubjectName = "",
      bool isItemSubscribed = false}) {
    _itemId = itemId;
    _itemType = itemType;
    _itemTitle = itemTitle;
    _itemMessage =
        (null == itemMessage) ? {"text": "", "highlights": []} : itemMessage;
    _itemImage = itemImage;
    _itemIcon = itemIcon;
    _itemStatus = itemStatus;
    _itemSubscription = (null == itemSubscription)
        ? {"targetId": "", "targetType": "", "targetName": "", "level": 0}
        : itemSubscription;
    _itemReadAt = itemReadAt;
    _itemCreatedAt = itemCreatedAt;

    _itemReceivedAt = itemReceivedAt;
    _itemUpdatedAt = itemUpdatedAt;
    _itemImageThumb = itemImageThumb;
    _itemAnimation = itemAnimation;
    _itemTracking = (null == itemTracking) ? {} : itemTracking;

    _itemSubjectName = itemSubjectName;
    _isItemSubscribed = isItemSubscribed;
  }
}
