import 'package:flutter/material.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/global/global.dart';
import '../../../core/classes/Menu.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;
  MenuWidget({this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Styles.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Styles.textColor10,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 8),
          Image.asset(
            menu.icon,
            height: 50,
          ),
          SizedBox(height: 8),
          Container(
            height: 27,
            alignment: Alignment.center,
            child: MyText.small(
              menu.name ?? "",
              textColor: Styles.textColor,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
