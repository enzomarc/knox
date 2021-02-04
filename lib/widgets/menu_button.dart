import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
    @required this.label,
    this.icon,
    this.onTap,
    this.selected = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final bool selected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: selected ? Color(0xFF334148) : Colors.white,
          boxShadow: [
            if (selected)
              BoxShadow(
                color: Color(0xFF334148).withOpacity(0.3),
                spreadRadius: 2.0,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Icon(
              icon ?? FlutterIcons.home_fea,
              color: selected ? Colors.white : Color(0xFF334148),
              size: 20.0,
            ),
            SizedBox(width: 10.0),
            Text(
              label ?? 'Home',
              style: TextStyle(
                color: selected ? Colors.white : Color(0xFF334148),
                fontFamily: 'Source SemiBold',
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
