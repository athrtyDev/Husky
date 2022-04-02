import 'package:flutter/material.dart';
import 'package:husky/global/global.dart';

class Separator extends StatelessWidget {
  const Separator();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.2,
      width: MediaQuery.of(context).size.width,
      color: Styles.textColor30,
    );
  }
}
