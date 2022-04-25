import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:provider/provider.dart';

class WordBigContainer extends StatelessWidget {
  final String text;
  final String description;
  final double height;

  const WordBigContainer({this.text, this.description, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<TtsProvider>(context, listen: false).speak(text),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.height * 0.22,
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
                  MyText(text, textColor: Styles.whiteColor, size: 40),
                  if (description != null) SizedBox(height: 15),
                  if (description != null) MyText(description, textColor: Styles.whiteColor, size: 20),
                ],
              ),
            ),
            Positioned(
                top: 30,
                right: 30,
                child: Icon(
                  Icons.record_voice_over_rounded,
                  color: Styles.whiteColor,
                ))
          ],
        ),
      ),
    );
  }
}
