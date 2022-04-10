import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/global/style.dart';

class GrammarHomeScreen extends StatefulWidget {
  const GrammarHomeScreen();

  @override
  _GrammarHomeScreenState createState() => _GrammarHomeScreenState();
}

class _GrammarHomeScreenState extends State<GrammarHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Дүрэм"),
      backgroundColor: Styles.greyColor,
    );
  }
}
