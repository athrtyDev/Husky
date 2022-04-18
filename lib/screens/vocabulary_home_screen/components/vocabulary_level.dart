import 'package:flutter/cupertino.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/global/global.dart';

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
              "100 үг",
              textColor: isSelected ? Styles.whiteColor : Styles.baseColor,
              fontWeight: Styles.wBold,
            )
          ],
        ));
  }
}
