import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:knox/core/models/category.dart';
import 'package:knox/core/models/password.dart';
import 'package:knox/core/providers/category_provider.dart';
import 'package:knox/core/providers/password_provider.dart';
import 'package:knox/core/services/password_service.dart';
import 'package:knox/core/utils/helpers.dart';
import 'package:provider/provider.dart';
import 'category.dart';
import 'custom_field.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({
    Key key,
  }) : super(key: key);

  @override
  _AddAccountModalState createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  TextEditingController title = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<CategoryProvider>(context, listen: false);
    final passwordProvider = Provider.of<PasswordProvider>(context, listen: false);
    List<Category> categories = provider.categories;

    return Container(
      padding: EdgeInsets.all(20.0),
      height: screenSize.height - 80.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 4.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: Color(0xFF334148).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Add New Account',
              style: TextStyle(
                color: Color(0xFF334148),
                fontFamily: 'Source Bold',
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          height: 80.0,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF03A69A).withOpacity(0.2),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(500.0),
                          ),
                          child: imageUrl == null
                              ? Icon(
                                  FlutterIcons.image_fea,
                                  color: Color(0xFF03A69A),
                                )
                              : Image.network(
                                  imageUrl,
                                  height: 20.0,
                                  width: 20.0,
                                ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Change image',
                          style: TextStyle(
                            color: Color(0xFF03A69A),
                            fontFamily: 'Source SemiBold',
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  CustomField(
                    label: 'Account Title',
                    placeholder: 'Typically the website name',
                    icon: FlutterIcons.title_mdi,
                    controller: title,
                  ),
                  SizedBox(height: 20.0),
                  CustomField(
                    label: 'Website',
                    placeholder: 'Enter website URL',
                    type: TextInputType.url,
                    controller: website,
                    onChanged: (str) async {
                      await helpers.grabFavicon(str).then((value) {
                        setState(() {
                          imageUrl = value;
                        });
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  CustomField(
                    label: 'Email / Phone Number',
                    placeholder: 'Your username on the website',
                    icon: FlutterIcons.smartphone_fea,
                    controller: username,
                  ),
                  SizedBox(height: 20.0),
                  CustomField(
                    label: 'Password',
                    placeholder: 'Your ultra secured password',
                    icon: FlutterIcons.lock_fea,
                    controller: _password,
                    isPassword: true,
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          _password.text = helpers.randomString(13);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFE8C79).withOpacity(0.2),
                          border: Border.all(
                            color: Color(0xFFFE8C79),
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Icon(FlutterIcons.refresh_cw_fea, color: Color(0xFFFE8C79), size: 14.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    _password.text.isNotEmpty ? "Generated: ${_password.text}" : '',
                    style: TextStyle(
                      color: Color(0xFF334148).withOpacity(0.3),
                      fontFamily: 'Source',
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Account Category',
                    style: TextStyle(
                      color: Color(0xFF334148),
                      fontFamily: 'Source SemiBold',
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'Double Tap on one category and the account will be saved into that category',
                    style: TextStyle(
                      color: Color(0xFF334148).withOpacity(0.3),
                      fontFamily: 'Source',
                      fontSize: 11.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 120.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        Category category = categories[index];

                        return CategoryWidget(
                          title: category.title,
                          image: category.image,
                          localImage: category.localImage,
                          onDoubleTap: () async {
                            if (title.text.isNotEmpty && username.text.isNotEmpty) {
                              Password password = Password(
                                title: title.text,
                                category: category.title.toLowerCase(),
                                url: website.text,
                                user: username.text,
                                password: _password.text,
                                image: imageUrl,
                                localImage: false,
                              );

                              bool created = await passwordService.storePassword(password);
                              if (created) {
                                passwordProvider.getPasswords();
                                Navigator.pop(context);
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
