import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key key,
    this.avatar,
    this.height,
    this.width,
  }) : super(key: key);

  final ImageProvider avatar;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50.0,
      height: height ?? 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(500.0),
        color: Color(0xFF334148),
        image: avatar != null ? DecorationImage(image: avatar, fit: BoxFit.cover) : null,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF334148).withOpacity(0.4),
            spreadRadius: 2.0,
            blurRadius: 10.0,
            offset: Offset(0, 8),
          ),
        ],
      ),
    );
  }
}
