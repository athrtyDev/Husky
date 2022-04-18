import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/global/global.dart';
import 'package:husky/screens/practice_screen/components/practice_choices.dart';

class PracticeScreen extends StatefulWidget {
  final dynamic args;
  const PracticeScreen({this.args});

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  String menuType;

  @override
  void initState() {
    super.initState();
    menuType = widget.args['menu_type'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Дасгал"),
      backgroundColor: Styles.greyColor,
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Text('nín'),
          )),
          PracticeChoices(),
        ],
      ),
    );
  }
}
