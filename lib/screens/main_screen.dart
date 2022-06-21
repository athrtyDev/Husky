import 'package:diyi/components/bottom_navigation_home.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/coming_soon_screen.dart';
import 'package:diyi/screens/home_screen/home_screen.dart';
import 'package:diyi/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  final dynamic args;
  MainScreen({this.args});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  DateTime currentBackPressTime;
  GlobalKey<ScaffoldState> leftMenuKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    int startingIndex = 0;
    int tabLength = 3;
    _controller = TabController(initialIndex: startingIndex, length: tabLength, vsync: this);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: leftMenuKey,
        backgroundColor: Styles.whiteColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  HomeScreen(),
                  ComingSoonScreen(canBack: false),
                  ProfileScreen(),
                ],
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            BottomNavigationHome(
              currentIndex: _controller.index,
              setIndex: (int index) {
                setState(() {
                  _controller.index = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    if (_controller.index != 0) {
      setState(() => _controller.index = 0);
    } else {
      DateTime now = DateTime.now();
      if (currentBackPressTime != null && now.difference(currentBackPressTime) < Duration(seconds: 1)) {
        currentBackPressTime = now;
        SystemNavigator.pop();
      }
      currentBackPressTime = now;
    }
    return Future.value(false);
  }
}
