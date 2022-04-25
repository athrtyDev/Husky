import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/grammar_home_screen/components/grammar_levels.dart';
import 'package:diyi/screens/grammar_home_screen/components/grammar_sub_levels.dart';

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
