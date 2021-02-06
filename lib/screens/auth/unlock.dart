import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:knox/core/providers/user_provider.dart';
import 'package:knox/core/services/user_service.dart';
import 'package:knox/core/utils/helpers.dart';
import 'package:knox/widgets/common/avatar.dart';
import 'package:knox/widgets/forms/passcode_widget.dart';
import 'package:provider/provider.dart';

class UnlockScreen extends StatefulWidget {
  @override
  _UnlockScreenState createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF03A69A),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dashboard_bg.png'),
              fit: BoxFit.contain,
              repeat: ImageRepeat.repeatY,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: screenSize.width - 70.0,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF334148).withOpacity(0.3),
                        spreadRadius: 1.0,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/locker_icon.png'),
                      Text(
                        'Enter your passcode',
                        style: TextStyle(
                          color: Color(0xFF334148),
                          fontFamily: 'Source SemiBold',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'For the security of your account, please enter the security code',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF334148).withOpacity(0.7),
                          fontFamily: 'Source',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: screenSize.width - 150.0,
                        child: PasscodeWidget(
                          onChanged: (code) async {
                            if (code.length > 3) {
                              if (await userService.checkPasscode(code)) {
                                Navigator.pushReplacementNamed(context, '/dashboard');
                              } else {
                                helpers.alert(scaffoldKey, "The given passcode is incorrect, retry.", title: 'Incorrect passcode');
                              }
                            } else {
                              helpers.alert(scaffoldKey, "The given passcode is incorrect, retry.", title: 'Incorrect passcode');
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Color(0xFF03A69A).withOpacity(0.1),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      IconButton(
                        icon: Icon(FlutterIcons.fingerprint_mco),
                        color: Color(0xFF334148).withOpacity(0.7),
                        iconSize: 40.0,
                        onPressed: () {
                          Navigator.pushNamed(context, '/register/general');
                        },
                      ),
                      SizedBox(height: 5.0),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Scan ',
                          style: TextStyle(
                            color: Color(0xFF334148),
                            fontFamily: 'Source SemiBold',
                            fontSize: 11.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'to verify\nfor easy security',
                              style: TextStyle(
                                fontFamily: 'Source',
                                color: Color(0xFF334148).withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
                Center(
                  child: Consumer<UserProvider>(
                    builder: (context, value, child) {
                      return AvatarWidget(
                        size: 70.0,
                        avatar: value.user != null ? FileImage(File(value.user.image)) : null,
                        label: value?.user?.name,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
