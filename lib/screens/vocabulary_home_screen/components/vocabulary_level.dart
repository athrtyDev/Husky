import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:provider/provider.dart';

class VocabularyLevel extends StatelessWidget {
  final int index;
  final bool isSelected;
  const VocabularyLevel({this.index, this.isSelected, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: isSelected ? Styles.baseColor70 : Styles.whiteColor),
        child: Column(
          children: [
            MyText.medium(
              "Түвшин $index",
              textColor: isSelected ? Styles.whiteColor : Styles.textColor,
            ),
            SizedBox(height: 3),
            MyText.small(
              "${Provider.of<VocabularyProvider>(context).hskTotal.containsKey(index.toString()) ? Provider.of<VocabularyProvider>(context).hskTotal[index.toString()] : 0} үг",
              textColor: isSelected ? Styles.whiteColor : Styles.baseColor,
              fontWeight: Styles.wBold,
            )
          ],
        ));
  }
}
