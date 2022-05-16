import 'package:flutter/material.dart';

class NotificationItemLeft extends StatelessWidget {
  const NotificationItemLeft(
      {Key? key, required this.image, required this.icon})
      : super(key: key);

  final String image;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(7.5),
          child: SizedBox(
              width: 43,
              height: 43,
              child: ClipRRect(
                  child: Image.network(image, loadingBuilder:
                      (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                    if (null == loadingProgress) {
                      return child;
                    }

                    return const Center(
                        child: CircularProgressIndicator(value: null));
                  }),
                  borderRadius: BorderRadius.circular(43)))),
      Positioned(
          bottom: 5.3,
          right: 5.3,
          child: Container(
              width: 17.4,
              height: 17.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(icon)),
                  borderRadius: BorderRadius.circular(43),
                  border: Border.all(
                      color: const Color(0xFFFFFFFF),
                      width: 15.9,
                      style: BorderStyle.solid))))
    ]);
  }
}
