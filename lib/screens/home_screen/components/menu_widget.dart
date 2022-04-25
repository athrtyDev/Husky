import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import '../../../core/classes/Menu.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;
  MenuWidget({this.menu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/${menu.type}_home_screen'),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Styles.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Styles.baseColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              menu.icon,
              height: 35,
            ),
            SizedBox(height: 15),
            MyText.small(
              menu.name ?? "",
              textColor: Styles.baseColor,
              fontWeight: Styles.wSemiBold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
