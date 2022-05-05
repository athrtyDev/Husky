import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

Widget myAppBar({
  String title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    title: MyText.large(title ?? '', textColor: Styles.textColor),
    actions: actions ?? [SizedBox(width: 50)],
    iconTheme: IconThemeData(
      color: Styles.baseColor,
    ),
    shadowColor: Colors.transparent,
    flexibleSpace: Container(decoration: BoxDecoration(color: Styles.whiteColor)),
  );
}
