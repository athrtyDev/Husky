import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class VocabularySubLevel extends StatelessWidget {
  final String name;
  final List<Vocabulary> listVocabulary;
  const VocabularySubLevel({this.name, this.listVocabulary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/vocabulary_list_screen", arguments: {'listVocabulary': listVocabulary});
      },
      child: Container(
          margin: EdgeInsets.all(6),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Styles.whiteColor,
              boxShadow: [BoxShadow(color: Styles.textColor10, offset: Offset(2, 4), spreadRadius: 0, blurRadius: 8)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: MyText.medium(
                  "Бүлэг $name",
                  textColor: Styles.whiteColor,
                  fontWeight: Styles.wBold,
                ),
              ),
              SizedBox(height: 10),
              MyText.medium(
                "${listVocabulary.length} үг",
                textColor: Styles.textColor,
              ),
            ],
          )),
    );
  }
}
