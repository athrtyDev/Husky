import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/global/style.dart';
import 'package:husky/screens/grammar_home_screen/components/grammar_levels.dart';
import 'package:husky/screens/grammar_home_screen/components/grammar_sub_levels.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [SingleChildScrollView(scrollDirection: Axis.horizontal, child: GrammarLevels()), GrammarSubLevels()],
          ),
        ));
  }
}
