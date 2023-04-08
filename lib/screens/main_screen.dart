import 'package:diyi/components/bottom_navigation_home.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/screens/UpdateScreen.dart';
import 'package:diyi/screens/home_screen/home_screen.dart';
import 'package:diyi/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

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
  bool shouldUpdate = false;

  @override
  void initState() {
    super.initState();
    int startingIndex = 0;
    int tabLength = 2;
    if (widget.args != null && widget.args['defaultTab'] != null) {
      startingIndex = int.tryParse(widget.args['defaultTab'].toString()) ?? 0;
    }
    _controller = TabController(initialIndex: startingIndex, length: tabLength, vsync: this);

    Future.delayed(Duration.zero, () async {
      Provider.of<UserProvider>(context, listen: false).checkLoggedUser();
    });
    checkVersion();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      shouldUpdate = int.parse(packageInfo.buildNumber) < app.appStaticData.static['approved_build_number'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldUpdate) {
      return UpdateScreen();
    } else {
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
                    // ComingSoonScreen(canBack: false),
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
