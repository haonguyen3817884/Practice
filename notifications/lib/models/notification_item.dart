import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/material.dart';

part 'notification_item.g.dart';

@JsonSerializable()
class Item {
  String id;
  String type;
  String title;
  dynamic message;
  String image;
  String icon;
  String status;

  dynamic subscription;
  int readAt;

  int createdAt;
  int receivedAt;
  int updatedAt;

  String imageThumb;
  String animation;

  dynamic tracking;

  String subjectName;

  bool isSubscribed;

  Item(
      {required this.id,
      required this.type,
      required this.title,
      required this.message,
      required this.image,
      required this.icon,
      required this.status,
      required this.subscription,
      required this.readAt,
      required this.createdAt,
      required this.receivedAt,
      required this.updatedAt,
      required this.imageThumb,
      required this.animation,
      required this.tracking,
      required this.subjectName,
      required this.isSubscribed});

  static String getItemDate(int milliseconds) {
    DateTime itemDate =
        DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");
    return dateFormat.format(itemDate);
  }

  bool isUnread() {
    return ("unread" == status) ? true : false;
  }

  Color getItemColor() {
    return (isUnread()) ? Colors.transparent : const Color(0xFFECF7E7);
  }

  /// Connect the generated [_$ItemFromJson] function to the `fromJson`
  /// factory.
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  /// Connect the generated [_$ItemToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
