import 'package:flutter/material.dart';
import 'package:diyi/components/separator.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/home_screen/components/home_banner.dart';
import 'package:diyi/screens/home_screen/components/home_practice.dart';
import 'package:diyi/screens/home_screen/components/home_header.dart';
import 'package:diyi/screens/home_screen/components/menu_group.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.greyColor,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Separator(),
                    MenuGroup(),
                  ],
                ),
              ),
              HomeBanner(),
              HomePractice(),
            ],
          ),
        ),
      ),
    );
  }
}
