import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class GrammarListItem extends StatelessWidget {
  final int index;
  const GrammarListItem({this.index, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/grammar_detail_screen");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Styles.whiteColor, borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(color: Styles.baseColor.withOpacity(0.1), offset: Offset(0, 4), blurRadius: 8, spreadRadius: 0)
        ]),
        width: MediaQuery.of(context).size.width * 0.9,
        child: MyText.medium(
          "Дүрэм $index",
          fontWeight: Styles.wBold,
          textColor: index.isEven ? Styles.textColor : Styles.textColor,
        ),
      ),
    );
  }
}
