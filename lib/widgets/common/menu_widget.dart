import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'avatar.dart';
import 'menu_button.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 50.0, 0.0, 20.0),
      child: Container(
        width: 300.0,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0xFF03A69A).withOpacity(0.1),
                ),
              ),
              child: Row(
                children: <Widget>[
                  AvatarWidget(height: 40.0, width: 40.0),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Marc Enzo',
                        style: TextStyle(
                          color: Color(0xFF334148),
                          fontFamily: 'Source SemiBold',
                          fontSize: 13.0,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        'emarc237@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF334148).withOpacity(0.5),
                          fontFamily: 'Source',
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: ListView(
                children: <Widget>[
                  MenuButton(label: 'Home'),
                  MenuButton(label: 'Donate', icon: FlutterIcons.attach_money_mdi),
                  MenuButton(label: 'Rate the app', icon: FlutterIcons.earth_mco),
                  MenuButton(label: 'Import/Export', icon: FlutterIcons.import_export_mdi),
                  MenuButton(label: 'Night Mode', icon: FlutterIcons.weather_night_mco, selected: true),
                  MenuButton(
                    label: 'Lock the app',
                    icon: FlutterIcons.lock_fea,
                    onTap: () => Navigator.pushNamed(context, '/unlock'),
                  ),
                  MenuButton(label: 'Settings', icon: FlutterIcons.settings_fea),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            MenuButton(label: 'Sign Out', icon: FlutterIcons.log_out_fea),
          ],
        ),
      ),
    );
  }
}