import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key key,
    this.avatar,
    this.size = 50.0,
    this.label,
  }) : super(key: key);

  final ImageProvider avatar;
  final double size;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: size,
            height: size,
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
                    size: size / 3.0,
                  )
                : null,
          ),
          SizedBox(height: 10.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source SemiBold',
            ),
          ),
        ],
      );
    } else {
      return Container(
        width: size,
        height: size,
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
                size: size / 3.0,
              )
            : null,
      );
    }
  }
}
