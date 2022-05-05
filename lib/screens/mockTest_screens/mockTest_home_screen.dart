import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

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
      backgroundColor: Styles.whiteColor,
      body: Center(
        child: MyText.xlarge("Тун удахгүй"),
      ),
    );
  }
}
