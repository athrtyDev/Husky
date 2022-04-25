import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/vocabulary_home_screen/components/vocabulary_levels.dart';
import 'package:diyi/screens/vocabulary_home_screen/components/vocabulary_sub_levels.dart';
import 'package:provider/provider.dart';

class VocabularyHomeScreen extends StatefulWidget {
  const VocabularyHomeScreen();

  @override
  _VocabularyHomeScreenState createState() => _VocabularyHomeScreenState();
}

class _VocabularyHomeScreenState extends State<VocabularyHomeScreen> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    await Provider.of<VocabularyProvider>(context, listen: false).init();
  }

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
