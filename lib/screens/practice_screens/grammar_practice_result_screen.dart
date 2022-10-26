import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/components/voice_icon.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/grammar_practice_model.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:diyi/screens/practice_screens/components/practice_result_header.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class GrammarPracticeResultScreen extends StatefulWidget {
  const GrammarPracticeResultScreen();

  @override
  _GrammarPracticeResultScreenState createState() => _GrammarPracticeResultScreenState();
}

class _GrammarPracticeResultScreenState extends State<GrammarPracticeResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          PracticeResultHeader(),
          _listWrongGrammar(),
        ],
      ),
    );
  }

  _listWrongGrammar() {
    var provider = context.watch<PracticeProvider>();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (provider.listWrongGrammar != null && provider.listWrongGrammar.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: MyText.large("Сайжруулах хэрэгтэй дүрмүүд"),
            ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: (provider.listWrongGrammar == null || provider.listWrongGrammar.isEmpty)
                ? _allCorrectWidget()
                : Column(
                    children: [
                      for (var item in provider.listWrongGrammar) _grammarTile(item),
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

  _grammarTile(GrammarPracticeModel grammar) {
    return InkWell(
      onTap: () => Provider.of<TtsProvider>(context, listen: false).speak(grammar.answer),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Styles.greyColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.large("${grammar.question}", fontWeight: Styles.wNormal),
            SizedBox(height: 5),
            MyText.medium(
              "${grammar.answer}",
              textColor: Styles.greenColor,
            )
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
