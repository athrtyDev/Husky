import 'dart:io';

import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import '../components/button.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({Key key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedeff4),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/update.gif", height: 300),
              MyText.large('Di yi'),
              MyText.large('аппликэйшнээ шинэчлээрэй!'),
              SizedBox(height: 20),
              if (Platform.isFuchsia)
                MyText.large(
                  'AppGallery руу орж шинэчлээрэй.',
                  textColor: Styles.baseColor,
                ),
              if (Platform.isAndroid)
                MyText.large(
                  'Заавар: Шинэчлэх товчийг дарж, дараа нь PlayStore дээрээс Update дарна.',
                  textColor: Styles.baseColor,
                ),
              if (Platform.isIOS)
                MyText.large(
                  'Заавар: Шинэчлэх товчийг дарж, дараа нь AppStore дээрээс Update дарна.',
                  textColor: Styles.baseColor,
                ),
              Expanded(child: SizedBox()),
              Button(
                text: 'Шинэчлэх',
                onClick: () {
                  LaunchReview.launch(
                    androidAppId: "diyi1019.mn",
                    iOSAppId: "6444391799",
                    writeReview: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
