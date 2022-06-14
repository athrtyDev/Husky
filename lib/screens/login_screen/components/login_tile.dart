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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Styles.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Image.asset(icon),
              SizedBox(width: 10),
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