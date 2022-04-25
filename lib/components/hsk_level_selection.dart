import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class HskLevelSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO switch hsk level
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            MyText.large(
              "HSK 1",
              textColor: Styles.whiteColor,
              fontWeight: Styles.wSemiBold,
            ),
            SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down,
              color: Styles.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
