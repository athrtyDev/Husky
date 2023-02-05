import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';

class LoginTile extends StatelessWidget {
  final Function login;
  final String icon;
  final String title;
  const LoginTile({Key key, @required this.login, @required this.icon, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        onTap: () {
          login();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Styles.whiteColor,
            border: Border.all(color: Styles.baseColor70),
            boxShadow: [
              BoxShadow(
                color: Styles.baseColor20,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, height: 27, width: 27),
              SizedBox(width: 15),
              MyText.large(
                title,
                textColor: Styles.textColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
