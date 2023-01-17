import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  final List<Widget> child;

  LoginContainer({Key key, this.child});

  Widget build(BuildContext context) {
    // bottom padding

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(color: Styles.whiteColor, borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Styles.baseColor20,
          spreadRadius: 0,
          blurRadius: 20,
          offset: Offset(0, 2),
        ),
      ]),
      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: child ?? SizedBox() as List<Widget>),
      ),
    );
  }
}
