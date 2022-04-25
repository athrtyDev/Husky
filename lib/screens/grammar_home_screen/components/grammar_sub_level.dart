import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class GrammarSubLevel extends StatelessWidget {
  final int index;
  final bool isSelected;
  const GrammarSubLevel({this.index, this.isSelected, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/grammar_list_screen");
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(6),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Styles.whiteColor,
              boxShadow: [BoxShadow(color: Styles.textColor10, offset: Offset(2, 4), spreadRadius: 0, blurRadius: 8)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.16,
                child: MyText.medium(
                  "Бүлэг $index",
                  textColor: Styles.textColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: MyText.medium(
                  "10/100",
                  textColor: Styles.whiteColor,
                  fontWeight: Styles.wBold,
                ),
              ),
            ],
          )),
    );
  }
}
