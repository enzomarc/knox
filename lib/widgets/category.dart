import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    @required this.title,
    @required this.image,
    this.onTap,
    this.onDoubleTap,
    this.localImage = false,
  }) : super(key: key);

  final String title;
  final String image;
  final bool localImage;
  final Function onTap;
  final Function onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(image != null ? 3.0 : 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(500.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF334148).withOpacity(0.13),
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: image != null
                  ? Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: localImage ? FileImage(File(image)) : NetworkImage(image),
                        ),
                      ),
                    )
                  : Icon(FlutterIcons.layer_group_faw5s, color: Color(0xFF334148)),
            ),
            SizedBox(height: 15.0),
            Text(
              title ?? 'Gaming',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF334148),
                fontFamily: 'Source SemiBold',
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
