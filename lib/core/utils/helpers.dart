import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:knox/core/resources/dio_wrapper.dart';

class Helpers {
  Random rand = Random();

  /// Generate random string with given `length`.
  String randomString(int len) {
    List<String> chars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    String generate = '';

    for (var i = 0; i < len; i++) {
      generate += rand.nextBool() ? chars[rand.nextInt(chars.length)] : chars[rand.nextInt(chars.length)].toUpperCase();
    }

    return generate;
  }

  /// Grab the favicon of the website with the specified `url`.
  Future grabFavicon(String url) async {
    String icon;

    try {
      Response response = await dioWrapper.get("http://favicongrabber.com/api/grab/$url");

      if (response.statusCode == 200) {
        var data = response.data;
        icon = (data['icons'] as List).firstWhere((icon) => !icon['src'].endsWith('svg'))['src'];
      }
    } on DioError catch (e) {
      print("Error while fetching favicon: ${e.message}");
    }

    return icon;
  }

  /// Show an alert using the snackbar
  /// of the current showed Scaffold.
  void alert(GlobalKey<ScaffoldState> scaffoldKey, String message, {String title}) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Color(0xFF334148).withOpacity(0.8),
            borderRadius: BorderRadius.circular(title == null ? 100.0 : 10.0),
          ),
          child: title == null
              ? Text(
                  message ?? "random content",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Source",
                    fontSize: 13.0,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Source SemiBold",
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      message ?? "random content",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Source",
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

Helpers helpers = Helpers();
