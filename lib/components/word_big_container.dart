import 'package:diyi/components/voice_icon.dart';
import 'package:diyi/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:provider/provider.dart';

class WordBigContainer extends StatelessWidget {
  final String text;
  final String? translation;
  final String? pronunciation;
  final double? height;
  final double? textSize;

  const WordBigContainer({required this.text, this.translation, this.pronunciation, this.height, this.textSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<TtsProvider>(context, listen: false).speak(text),
      child: Container(
        decoration: BoxDecoration(
            color: Styles.whiteColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Styles.baseColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (pronunciation != null) MyText(pronunciation, textColor: Styles.whiteColor, size: 15),
                        MyText(
                          text,
                          textColor: Styles.whiteColor,
                          size: textSize == null ? (pronunciation != null ? 40 : 30) : textSize,
                          fontWeight: FontWeight.w200,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(top: 10, right: 30, child: VoiceIcon())
                ],
              ),
            ),
            if (translation != null)
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Styles.whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText.large("Орчуулга: ", fontWeight: Styles.wNormal),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Styles.textColor10,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: MyText.large("${Formatter.capitalizeFirstLetter(translation ?? "")}", textColor: Styles.baseColor),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
