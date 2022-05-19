import 'package:diyi/components/button.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

class StudyChinaHomeScreen extends StatefulWidget {
  const StudyChinaHomeScreen();

  @override
  _StudyChinaHomeScreenState createState() => _StudyChinaHomeScreenState();
}

class _StudyChinaHomeScreenState extends State<StudyChinaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "БНХАУ-д сурах"),
      backgroundColor: Styles.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText.xlarge("Тун удахгүй"),
            SizedBox(height: 30),
            Container(
              width: 200,
              child: Button(
                text: "Буцах",
                onClick: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
