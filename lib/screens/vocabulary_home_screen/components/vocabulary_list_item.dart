import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class VocabularyListItem extends StatelessWidget {
  final Vocabulary vocabulary;
  const VocabularyListItem({this.vocabulary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/vocabulary_detail_screen");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Styles.whiteColor, borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(color: Styles.baseColor.withOpacity(0.1), offset: Offset(0, 4), blurRadius: 8, spreadRadius: 0)
        ]),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Column(
              children: [
                MyText.medium(
                  vocabulary.word,
                  textColor: Styles.textColor,
                ),
                // MyText.medium(
                //   "一",
                //   fontWeight: Styles.wBold,
                //   textColor: Styles.textColor,
                // )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                MyText.medium(
                  vocabulary.pronunciation,
                  textColor: Styles.textColor,
                ),
                MyText.medium(
                  vocabulary.translation,
                  fontWeight: Styles.wBold,
                  textColor: Styles.textColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
