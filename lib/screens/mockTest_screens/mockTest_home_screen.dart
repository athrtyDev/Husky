import 'package:diyi/screens/coming_soon_screen.dart';
import 'package:flutter/material.dart';

class MockTestHomeScreen extends StatefulWidget {
  const MockTestHomeScreen();

  @override
  _MockTestHomeScreenState createState() => _MockTestHomeScreenState();
}

class _MockTestHomeScreenState extends State<MockTestHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ComingSoonScreen();
  }
}
