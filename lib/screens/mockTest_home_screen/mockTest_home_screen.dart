import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/global/style.dart';

class MockTestHomeScreen extends StatefulWidget {
  const MockTestHomeScreen();

  @override
  _MockTestHomeScreenState createState() => _MockTestHomeScreenState();
}

class _MockTestHomeScreenState extends State<MockTestHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Тест"),
      backgroundColor: Styles.greyColor,
    );
  }
}
