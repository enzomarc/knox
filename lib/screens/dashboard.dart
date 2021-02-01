import 'package:flutter_icons/flutter_icons.dart';
import 'package:knox/core/utils/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
          onTap: () {},
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
                          ],
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          height: 120.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                                  width: 100.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(20.0),
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
                                        child: Icon(
                                          FlutterIcons.game_controller_sli,
                                          color: Color(0xFF334148),
                                        ),
                                      ),
                                      SizedBox(height: 15.0),
                                      Text(
                                        'Gaming',
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
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
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
                                        child: Icon(
                                          FlutterIcons.spotify_ent,
                                          color: Colors.green.shade400,
                                        ),
                                      ),
                                      SizedBox(width: 15.0),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Spotify',
                                            style: TextStyle(
                                              color: Color(0xFF334148),
                                              fontFamily: 'Source SemiBold',
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            'enzo.koriodan@gmail.com',
                                            style: TextStyle(
                                              color: Color(0xFF334148),
                                              fontFamily: 'Source',
                                              fontSize: 11.0,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            '************',
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
