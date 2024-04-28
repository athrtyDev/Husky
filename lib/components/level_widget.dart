import 'package:flutter/cupertino.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class LevelWidget extends StatelessWidget {
  final String name;
  final int total;
  final bool isSelected;
  final String type;
  const LevelWidget({required this.name, required this.total, required this.isSelected, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Styles.baseColor70 : Styles.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Styles.baseColor20),
          boxShadow: [
            BoxShadow(
              color: Styles.baseColor20,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          children: [
            MyText.medium(
              name,
              textColor: isSelected ? Styles.whiteColor : Styles.textColor,
            ),
            SizedBox(height: 3),
            MyText.small(
              "$total $type",
              textColor: isSelected ? Styles.whiteColor : Styles.baseColor,
              fontWeight: Styles.wBold,
            )
          ],
        ));
  }
}
