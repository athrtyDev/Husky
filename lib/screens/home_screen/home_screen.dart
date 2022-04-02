import 'package:flutter/material.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/components/separator.dart';
import 'package:husky/global/style.dart';
import 'package:husky/screens/home_screen/components/home_banner.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    HomeHeader(),
                    SizedBox(height: 10),
                    Separator(),
                    MenuGroup(),
                  ],
                ),
              ),
              HomeBanner(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    MyText.large("Дасгал"),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
