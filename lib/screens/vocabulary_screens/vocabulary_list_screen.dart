import 'package:diyi/components/my_text.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/vocabulary_screens/components/vocabulary_list_item.dart';

class VocabularyListScreen extends StatefulWidget {
  final dynamic args;
  const VocabularyListScreen({this.args});

  @override
  _VocabularyListScreenState createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends State<VocabularyListScreen> {
  String headerName;
  List<Vocabulary> listVocabulary;

  @override
  void initState() {
    listVocabulary = widget.args['listVocabulary'];
    headerName = widget.args['headerName'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: headerName),
        backgroundColor: Styles.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText("Нийт ${listVocabulary.length} үг:", fontWeight: Styles.wBold),
              SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var item in listVocabulary)
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/vocabulary_detail_screen", arguments: {'vocabulary': item});
                          },
                          child: VocabularyListItem(vocabulary: item),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
