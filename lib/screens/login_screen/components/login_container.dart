import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  final List<Widget> child;

  LoginContainer({Key key, this.child});

  Widget build(BuildContext context) {
    // bottom padding
    if (child != null) {
      child.add(SizedBox(height: 60));
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          gradient: Styles.baseGradient,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: child ?? SizedBox() as List<Widget>),
      ),
    );
  }
}
