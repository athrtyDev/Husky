import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

Widget myAppBar({
  String title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    title: MyText.large(title ?? '', textColor: Styles.whiteColor),
    actions: actions ?? [SizedBox(width: 50)],
    shadowColor: Colors.transparent,
    flexibleSpace: Container(decoration: BoxDecoration(gradient: Styles.baseGradient)),
  );
}
