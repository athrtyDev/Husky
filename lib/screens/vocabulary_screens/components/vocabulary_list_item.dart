import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class VocabularyListItem extends StatelessWidget {
  final Vocabulary vocabulary;
  const VocabularyListItem({this.vocabulary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      margin: EdgeInsets.only(bottom: 10),
      decoration: Styles.myBoxDecoration,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Column(
            children: [
              MyText.medium(
                vocabulary.pronunciation,
                textColor: Styles.textColor,
              ),
              MyText.xlarge(
                vocabulary.word,
                textColor: Styles.textColor,
              ),
            ],
          ),
          SizedBox(width: 30),
          MyText.medium(
            Formatter.capitalizeFirstLetter(vocabulary.translation),
            fontWeight: Styles.wSemiBold,
            textColor: Styles.textColor,
          ),
          Expanded(child: SizedBox()),
          Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Styles.baseColor),
        ],
      ),
    );
  }
}
