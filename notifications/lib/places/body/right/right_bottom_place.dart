import 'package:flutter/material.dart';

class NotificationItemRightBottom extends StatelessWidget {
  const NotificationItemRightBottom({Key? key, required this.date})
      : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(date,
        style: const TextStyle(fontSize: 11.5, color: Color(0xFF808080)));
  }
}
