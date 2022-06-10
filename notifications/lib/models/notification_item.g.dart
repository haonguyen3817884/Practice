// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'],
      image: json['image'] as String,
      icon: json['icon'] as String,
      status: json['status'] as String,
      subscription: json['subscription'],
      readAt: json['readAt'] as int,
      createdAt: json['createdAt'] as int,
      receivedAt: json['receivedAt'] as int,
      updatedAt: json['updatedAt'] as int,
      imageThumb: json['imageThumb'] as String,
      animation: json['animation'] as String,
      tracking: json['tracking'],
      subjectName: json['subjectName'] as String,
      isSubscribed: json['isSubscribed'] as bool,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'image': instance.image,
      'icon': instance.icon,
      'status': instance.status,
      'subscription': instance.subscription,
      'readAt': instance.readAt,
      'createdAt': instance.createdAt,
      'receivedAt': instance.receivedAt,
      'updatedAt': instance.updatedAt,
      'imageThumb': instance.imageThumb,
      'animation': instance.animation,
      'tracking': instance.tracking,
      'subjectName': instance.subjectName,
      'isSubscribed': instance.isSubscribed,
    };
