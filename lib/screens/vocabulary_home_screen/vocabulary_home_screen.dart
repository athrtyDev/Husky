import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/global/style.dart';
import 'package:husky/screens/vocabulary_home_screen/components/vocabulary_levels.dart';
import 'package:husky/screens/vocabulary_home_screen/components/vocabulary_sub_levels.dart';

class VocabularyHomeScreen extends StatefulWidget {
  const VocabularyHomeScreen();

  @override
  _VocabularyHomeScreenState createState() => _VocabularyHomeScreenState();
}

class _VocabularyHomeScreenState extends State<VocabularyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "Үг цээжлэх"),
        backgroundColor: Styles.greyColor,
        body: SingleChildScrollView(
          child: Column(
            children: [SingleChildScrollView(scrollDirection: Axis.horizontal, child: VocabularyLevels()), VocabularySubLevels()],
          ),
        ));
  }
}
