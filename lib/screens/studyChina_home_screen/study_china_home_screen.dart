import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/global/style.dart';

class StudyChinaHomeScreen extends StatefulWidget {
  const StudyChinaHomeScreen();

  @override
  _StudyChinaHomeScreenState createState() => _StudyChinaHomeScreenState();
}

class _StudyChinaHomeScreenState extends State<StudyChinaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "БНХАУ-д сурах"),
      backgroundColor: Styles.greyColor,
    );
  }
}
