import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key key,
    this.avatar,
    this.height = 50.0,
    this.width = 50.0,
  }) : super(key: key);

  final ImageProvider avatar;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
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
      child: avatar == null
          ? Icon(
              FlutterIcons.user_fea,
              size: height / 3.0,
            )
          : null,
    );
  }
}
