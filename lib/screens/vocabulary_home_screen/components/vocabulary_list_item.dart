import 'package:flutter/material.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/global/global.dart';

class VocabularyListItem extends StatelessWidget {
  final int index;
  const VocabularyListItem({this.index, Key key}) : super(key: key);

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
                  "yi",
                  textColor: index.isEven ? Styles.textColor : Styles.textColor,
                ),
                MyText.medium(
                  "一",
                  fontWeight: Styles.wBold,
                  textColor: index.isEven ? Styles.textColor : Styles.textColor,
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                MyText.medium(
                  "n",
                  textColor: index.isEven ? Styles.textColor : Styles.textColor,
                ),
                MyText.medium(
                  "нэг",
                  fontWeight: Styles.wBold,
                  textColor: index.isEven ? Styles.textColor : Styles.textColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
