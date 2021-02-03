import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key key,
    @required this.title,
    @required this.username,
    this.password,
    this.image,
    this.localImage = false,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String username;
  final String password;
  final String image;
  final bool localImage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    String pwd = '';
    for (var i = 0; i < password.length; i++) pwd += '*';

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        margin: EdgeInsets.only(bottom: 13.0),
        decoration: BoxDecoration(
          color: Color(0xFFF8F7FB),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
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
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: localImage ? FileImage(File(image)) : NetworkImage(image),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title ?? 'Spotify',
                      style: TextStyle(
                        color: Color(0xFF334148),
                        fontFamily: 'Source SemiBold',
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      username ?? 'user@mail.com',
                      style: TextStyle(
                        color: Color(0xFF334148),
                        fontFamily: 'Source',
                        fontSize: 11.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      pwd ?? '*',
                      style: TextStyle(
                        color: Color(0xFF334148),
                        fontFamily: 'Source',
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              child: Icon(
                FlutterIcons.ios_more_ion,
                size: 16.0,
                color: Color(0xFF334148),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
