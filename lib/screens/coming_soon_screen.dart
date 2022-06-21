import 'package:diyi/components/button.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

class ComingSoonScreen extends StatefulWidget {
  final bool canBack;

  ComingSoonScreen({this.canBack = true});

  @override
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: ""),
      backgroundColor: Styles.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/bg_coming_soon.png",
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            SizedBox(height: 30),
            MyText.xlarge("Тун удахгүй"),
            SizedBox(height: 30),
            if (widget.canBack)
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
