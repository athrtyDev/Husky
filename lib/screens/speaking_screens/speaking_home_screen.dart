import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/utils/base_functions.dart';
import 'package:flutter/material.dart';

class SpeakingHomeScreen extends StatefulWidget {
  const SpeakingHomeScreen();

  @override
  _SpeakingHomeScreenState createState() => _SpeakingHomeScreenState();
}

class _SpeakingHomeScreenState extends State<SpeakingHomeScreen> {
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
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MyText.xlarge(
                "Ярианы Хятад хэл тун удахгүй орох болно.\n",
                maxLines: 5,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 200,
              child: Button(
                text: "Хүлээж байна",
                onClick: () {
                  showSuccessToasts("Хүсэлт хүлээн авлаа");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
