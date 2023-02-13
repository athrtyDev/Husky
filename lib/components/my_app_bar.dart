import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

Widget myAppBar({
  String title,
  Widget leading,
  List<Widget> actions,
  Color color,
}) {
  return AppBar(
    title: MyText.large(title ?? '', textColor: Styles.textColor),
    actions: actions ?? [const SizedBox(width: 50)],
    iconTheme: IconThemeData(
      color: Styles.baseColor,
    ),
    shadowColor: Colors.transparent,
    centerTitle: true,
    flexibleSpace: Container(decoration: BoxDecoration(color: color ?? Styles.whiteColor)),
  );
}
