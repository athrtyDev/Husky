import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/vocabulary_home_screen/components/vocabulary_list_item.dart';

class VocabularyListScreen extends StatefulWidget {
  final dynamic args;
  const VocabularyListScreen({this.args, Key key}) : super(key: key);

  @override
  _VocabularyListScreenState createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends State<VocabularyListScreen> {
  List<Vocabulary> listVocabulary;

  @override
  void initState() {
    listVocabulary = widget.args['listVocabulary'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "Шинэ үг цээжлэх"),
        backgroundColor: Styles.greyColor,
        body: Container(
          margin: EdgeInsets.all(7),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int index = 0; index < listVocabulary.length; index++)
                  VocabularyListItem(
                    vocabulary: listVocabulary[index],
                  )
              ],
            ),
          ),
        ));
  }
}
