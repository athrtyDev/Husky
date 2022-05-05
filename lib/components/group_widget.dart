import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class GroupWidget extends StatelessWidget {
  final String name;
  final int total;
  final int studied;

  const GroupWidget({this.name, this.total, this.studied});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(15),
        decoration: Styles.myBoxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.16,
              child: MyText.medium(
                name,
                textColor: Styles.textColor,
                fontWeight: Styles.wBold,
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: MyText.medium(
                "$studied/$total",
                textColor: Styles.whiteColor,
                fontWeight: Styles.wBold,
              ),
            ),
          ],
        ));
  }
}
