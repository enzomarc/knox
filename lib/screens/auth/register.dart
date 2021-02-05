import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knox/widgets/forms/custom_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File _image;
  ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF03A69A),
      body: SafeArea(
        child: SingleChildScrollView(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenSize.width - 70.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Getting Started',
                        style: TextStyle(
                          color: Color(0xFF334148),
                          fontFamily: 'Source SemiBold',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        "Before starting, create your user account\nWe'll use your account later for synchronization",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF334148).withOpacity(0.7),
                          fontFamily: 'Source',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Center(
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                getImage();
                              },
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF03A69A).withOpacity(0.2),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(500.0),
                                ),
                                child: _image == null
                                    ? Icon(
                                        FlutterIcons.image_fea,
                                        color: Color(0xFF334148).withOpacity(0.7),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(500.0),
                                          image: DecorationImage(image: FileImage(_image), fit: BoxFit.fill),
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Choose avatar',
                              style: TextStyle(
                                color: Color(0xFF334148).withOpacity(0.7),
                                fontFamily: 'Source SemiBold',
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      CustomField(
                        label: 'Name',
                        placeholder: 'Enter your full name',
                        icon: FlutterIcons.user_fea,
                      ),
                      SizedBox(height: 20.0),
                      CustomField(
                        label: 'Email',
                        placeholder: 'address@company.com',
                        type: TextInputType.emailAddress,
                        icon: FlutterIcons.mail_fea,
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register/code');
                            },
                            color: Color(0xFF334148),
                            splashColor: Color(0xFF03A69A).withOpacity(0.3),
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Color(0xFF334148), width: 1.5),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Next Step',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Source Semibold',
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Icon(
                                  FlutterIcons.arrow_right_fea,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                    ],
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
