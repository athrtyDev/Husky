import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/global/style.dart';
import 'package:husky/screens/grammar_home_screen/components/grammar_list_item.dart';

class GrammarListScreen extends StatefulWidget {
  final dynamic args;
  const GrammarListScreen({this.args, Key key}) : super(key: key);

  @override
  _GrammarListScreenState createState() => _GrammarListScreenState();
}

class _GrammarListScreenState extends State<GrammarListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "Дүрэм"),
        backgroundColor: Styles.greyColor,
        body: Container(
          margin: EdgeInsets.all(7),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int index = 0; index < 10; index++)
                  GrammarListItem(
                    index: index,
                  )
              ],
            ),
          ),
        ));
  }
}
