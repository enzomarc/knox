import 'package:flutter_icons/flutter_icons.dart';
import 'package:knox/core/models/category.dart';
import 'package:knox/core/models/password.dart';
import 'package:knox/core/providers/category_provider.dart';
import 'package:knox/core/providers/password_provider.dart';
import 'package:knox/core/utils/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:knox/widgets/add_category_modal.dart';
import 'package:knox/widgets/add_account_modal.dart';
import 'package:knox/widgets/category.dart';
import 'package:knox/widgets/password.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    final CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    statusBar.setColor(context: context);

    return Scaffold(
      backgroundColor: Color(0xFF03A69A),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              barrierColor: Color(0xFF03A69A).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              builder: (BuildContext context) => AddAccountModal(),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFF334148),
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF334148).withOpacity(0.4),
                  spreadRadius: 2.0,
                  blurRadius: 10.0,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16.0,
                ),
                SizedBox(width: 5.0),
                Text(
                  'Add Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source SemiBold',
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/dashboard_bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FlutterIcons.menu_fea,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    FlutterIcons.ios_notifications_outline_ion,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 5.0),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(500.0),
                                    color: Color(0xFF334148),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFF334148).withOpacity(0.4),
                                        spreadRadius: 2.0,
                                        blurRadius: 10.0,
                                        offset: Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'Welcome home',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: 'Source',
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Marc Enzo',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Coves Bold',
                            fontSize: 35.0,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: 'Source SemiBold',
                                  fontSize: 14.0,
                                  color: Color(0xFF334148).withOpacity(0.8),
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                  labelText: "Search",
                                  prefixIcon: Icon(FlutterIcons.search_fea, color: Color(0xFF334148)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: 'Source',
                                    fontSize: 14.0,
                                    color: Color(0xFF334148).withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            GestureDetector(
                              onTap: () {
                                // implements search filters
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFE8C79),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    FlutterIcons.ios_options_ion,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: screenSize.width,
                    padding: EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Password Categories',
                              style: TextStyle(
                                color: Color(0xFF334148),
                                fontFamily: 'Source SemiBold',
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // add password category
                              },
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    barrierColor: Color(0xFF334148).withOpacity(0.3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                    builder: (BuildContext context) => AddCategoryModal(),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF334148),
                                    ),
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  child: Icon(
                                    FlutterIcons.plus_fea,
                                    color: Color(0xFF334148),
                                    size: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          height: 120.0,
                          child: Consumer<CategoryProvider>(
                            builder: (BuildContext context, CategoryProvider value, Widget child) {
                              List<Category> categories = value.categories;

                              if (categories != null && categories.length > 0) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    Category category = categories[index];

                                    return CategoryWidget(
                                      title: category.title,
                                      image: category.image,
                                      localImage: category.localImage,
                                    );
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    "There's no category available.\nClick on + to add category.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF334148).withOpacity(0.3),
                                      fontFamily: 'Coves Bold',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SlidingUpPanel(
              minHeight: screenSize.height / 2.0 - 100.0,
              maxHeight: screenSize.height - 100.0,
              backdropEnabled: true,
              backdropColor: Color(0xFF03A69A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF334148).withOpacity(0.1),
                  blurRadius: 20.0,
                  spreadRadius: 5.0,
                ),
              ],
              panel: Container(
                padding: EdgeInsets.all(20.0),
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
                      'Latest Password',
                      style: TextStyle(
                        color: Color(0xFF334148),
                        fontFamily: 'Source Bold',
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: Consumer<PasswordProvider>(
                        builder: (BuildContext context, PasswordProvider value, Widget child) {
                          List<Password> passwords = value.passwords.reversed.take(10).toList();

                          return ListView.builder(
                            itemCount: passwords.length,
                            itemBuilder: (context, index) {
                              Password password = passwords[index];

                              return PasswordWidget(
                                title: password.title,
                                username: password.user,
                                password: password.password,
                                image: password.image,
                                localImage: password.localImage,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
