import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key key,
    this.title,
    this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}