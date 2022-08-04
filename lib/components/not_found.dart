import 'package:diyi/components/my_text.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Image.asset(
            "assets/images/not_found.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: 10),
        MyText.large("Дата байхгүй байна."),
        SizedBox(height: 130),
      ],
    );
  }
}
