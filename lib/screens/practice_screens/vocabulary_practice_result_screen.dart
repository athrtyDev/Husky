import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/components/voice_icon.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class VocabularyPracticeResultScreen extends StatefulWidget {
  const VocabularyPracticeResultScreen();

  @override
  _VocabularyPracticeResultScreenState createState() => _VocabularyPracticeResultScreenState();
}

class _VocabularyPracticeResultScreenState extends State<VocabularyPracticeResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          _resultHeader(),
          _listWrongVocabulary(),
        ],
      ),
    );
  }

  _resultHeader() {
    var provider = context.watch<VocabularyPracticeProvider>();
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: kToolbarHeight + 10, bottom: 25, left: 30, right: 30),
          decoration: BoxDecoration(
            gradient: Styles.baseGradient,
          ),
          child: Column(
            children: [
              MyText.large(
                "Тестийн хариу",
                textColor: Styles.whiteColor,
                fontWeight: Styles.wSemiBold,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Styles.baseColor20,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Expanded(
                child: CircularPercentIndicator(
                  radius: 45,
                  lineWidth: 10.0,
                  animation: true,
                  percent: provider.totalCorrectAnswers / provider.totalQuestions,
                  center: MyText.xlarge(
                    "${(provider.totalCorrectAnswers / provider.totalQuestions * 100).ceil()}%",
                    fontWeight: Styles.wSemiBold,
                    textColor: Styles.textColor,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Styles.greenColor,
                  backgroundColor: Styles.greyColor,
                ),
              ),
              Container(height: 70, width: 0.5, color: Styles.textColor50),
              Expanded(
                child: Column(
                  children: [
                    MyText.xlarge(
                      "${provider.totalCorrectAnswers} / ${provider.totalQuestions}",
                      fontWeight: Styles.wSemiBold,
                      textColor: Styles.textColor,
                    ),
                    SizedBox(height: 5),
                    MyText.small(
                      "Зөв / Нийт",
                      fontWeight: Styles.wSemiBold,
                      textColor: Styles.textColor70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _listWrongVocabulary() {
    var provider = context.watch<VocabularyPracticeProvider>();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (provider.listWrongVocabulary != null && provider.listWrongVocabulary.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: MyText.large("Сайжруулах хэрэгтэй үгс"),
            ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: (provider.listWrongVocabulary == null || provider.listWrongVocabulary.isEmpty)
                ? _allCorrectWidget()
                : Column(
                    children: [
                      for (var item in provider.listWrongVocabulary) _vocabularyTile(item),
                    ],
                  ),
          ))),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50, bottom: 30, top: 15),
            child: Button(
              text: "Дуусгах",
              onClick: () {
                Navigator.of(context).pushNamedAndRemoveUntil("/main", (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }

  _vocabularyTile(Vocabulary vocabulary) {
    return InkWell(
      onTap: () => Provider.of<TtsProvider>(context, listen: false).speak(vocabulary.word),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Styles.greyColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Column(
              children: [
                MyText.medium("${vocabulary.pronunciation}"),
                MyText.xlarge("${vocabulary.word}", fontWeight: Styles.wNormal),
              ],
            ),
            SizedBox(width: 30),
            Expanded(child: MyText.medium("${vocabulary.translation}")),
            VoiceIcon(isWhite: false),
          ],
        ),
      ),
    );
  }

  _allCorrectWidget() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/bg_success.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: 30),
        MyText("祝贺", fontWeight: Styles.wNormal, size: Styles.xlarge * 2),
      ],
    );
  }
}
