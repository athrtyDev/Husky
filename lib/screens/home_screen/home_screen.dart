import 'package:flutter/material.dart';
import 'package:husky/components/separator.dart';
import 'package:husky/global/style.dart';
import 'package:husky/screens/home_screen/components/home_banner.dart';
import 'package:husky/screens/home_screen/components/home_exercise.dart';
import 'package:husky/screens/home_screen/components/home_header.dart';
import 'package:husky/screens/home_screen/components/menu_group.dart';

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
              HomeExercise(),
            ],
          ),
        ),
      ),
    );
  }
}
