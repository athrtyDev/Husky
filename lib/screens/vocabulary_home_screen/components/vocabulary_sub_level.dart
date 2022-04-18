import 'package:flutter/material.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/global/global.dart';

class VocabularySubLevel extends StatelessWidget {
  final int index;
  final bool isSelected;
  const VocabularySubLevel({this.index, this.isSelected, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/vocabulary_list_screen");
      },
      child: Container(
          margin: EdgeInsets.all(6),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Styles.whiteColor,
              boxShadow: [BoxShadow(color: Styles.textColor10, offset: Offset(2, 4), spreadRadius: 0, blurRadius: 8)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: MyText.medium(
                      "10/100",
                      textColor: Styles.whiteColor,
                      fontWeight: Styles.wBold,
                    ),
                  ),
                  SizedBox(height: 3),
                  MyText.medium(
                    "Бүлэг $index",
                    textColor: Styles.textColor,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
