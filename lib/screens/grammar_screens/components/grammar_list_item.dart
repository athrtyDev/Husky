import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/utils/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:flutter/widgets.dart';

class GrammarListItem extends StatelessWidget {
  final Grammar grammar;
  const GrammarListItem({required this.grammar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      margin: EdgeInsets.only(bottom: 10),
      decoration: Styles.myBoxDecoration,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.medium(
                  grammar.pronunciation,
                  textColor: Styles.textColor,
                ),
                MyText.xlarge(
                  grammar.grammar,
                  textColor: Styles.textColor,
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: MyText.medium(
              Formatter.capitalizeFirstLetter(grammar.translation ?? ""),
              fontWeight: Styles.wSemiBold,
              textColor: Styles.textColor,
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Styles.baseColor),
        ],
      ),
    );
  }
}
