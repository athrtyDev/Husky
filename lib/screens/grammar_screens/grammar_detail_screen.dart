import 'dart:ui';
import 'package:diyi/components/button.dart';
import 'package:diyi/components/tts_speed_icon.dart';
import 'package:diyi/components/voice_icon.dart';
import 'package:diyi/components/word_big_container.dart';
import 'package:diyi/core/classes/Grammar.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:provider/provider.dart';

class GrammarDetailScreen extends StatefulWidget {
  final dynamic args;
  const GrammarDetailScreen({this.args});

  @override
  _GrammarDetailScreenState createState() => _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends State<GrammarDetailScreen> {
  late Grammar grammar;
  late List<Grammar> listGrammar;
  late int grammarIndex;
  late String title;

  @override
  void initState() {
    super.initState();
    listGrammar = widget.args['listGrammar'];
    grammarIndex = widget.args['index'];
    grammar = listGrammar[grammarIndex];
    title = widget.args['title'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: title, actions: TtsSpeedIcon(context)),
      backgroundColor: Styles.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    WordBigContainer(
                      text: grammar.grammar ?? "",
                      pronunciation: grammar.pronunciation,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.large("Тайлбар:", fontWeight: Styles.wSemiBold),
                          SizedBox(height: 5),
                          Container(
                            color: Styles.textColor10,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: MyText.large(grammar.tailbar, fontWeight: Styles.wSemiBold),
                          ),
                          SizedBox(height: 40),
                          if (grammar.example1 != null && grammar.example1 != "")
                            MyText.large("Жишээ өгүүлбэр:", fontWeight: Styles.wSemiBold),
                          SizedBox(height: 20),
                          if (grammar.example1 != null && grammar.example1 != "")
                            _exampleWidget(
                                grammar.example1 ?? "",
                                grammar.example1Pronunciation ?? "",
                                grammar.example1Translation ?? "",
                                Provider.of<TtsProvider>(context, listen: true).hidePronunciation1,
                                Provider.of<TtsProvider>(context, listen: true).hideTranslation1,
                                1),
                          SizedBox(height: 20),
                          if (grammar.example2 != null && grammar.example2 != "")
                            _exampleWidget(
                                grammar.example2 ?? "",
                                grammar.example2Pronunciation ?? "",
                                grammar.example2Translation ?? "",
                                Provider.of<TtsProvider>(context, listen: true).hidePronunciation2,
                                Provider.of<TtsProvider>(context, listen: true).hideTranslation2,
                                2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 25),
              child: grammarIndex < (listGrammar.length - 1)
                  ? Button(
                      text: "Дараагийнх",
                      onClick: _next,
                    )
                  : Button.disabled(
                      text: "Дараагийнх",
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exampleWidget(String example, String pronunciation, String translation, bool isBlur, bool isBlurTrans, int order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              exampleStepper(
                "word",
                example,
                false,
                () {
                  Provider.of<TtsProvider>(context, listen: false).speak(example);
                },
              ),
              exampleStepper(
                "pronunciation",
                pronunciation,
                isBlur,
                () {
                  Provider.of<TtsProvider>(context, listen: false).switchPronunciation(order);
                },
              ),
              exampleStepper(
                "translation",
                translation,
                isBlurTrans,
                () {
                  Provider.of<TtsProvider>(context, listen: false).switchTranslation(order);
                },
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => Provider.of<TtsProvider>(context, listen: false).speak(example),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: VoiceIcon(isWhite: false),
          ),
        )
      ],
    );
  }

  exampleStepper(String type, String text, bool isBlur, Function onClick) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Row(
          children: [
            Container(
              width: 20,
              child: Column(
                children: [
                  type == "word"
                      ? SizedBox(height: 10)
                      : Expanded(
                          flex: 1,
                          child: VerticalDivider(
                            thickness: 1,
                            color: Styles.baseColor70,
                          ),
                        ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Styles.baseColor70),
                  ),
                  type == "translation"
                      ? SizedBox(height: 25)
                      : Expanded(
                          flex: 3,
                          child: VerticalDivider(
                            thickness: 1,
                            color: Styles.baseColor70,
                          ),
                        )
                ],
              ),
            ),
            Expanded(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: isBlur ? 3 : 0,
                  sigmaY: isBlur ? 3 : 0,
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 15, top: 5, left: 10, right: 10),
                  child: isBlur
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: MyText(
                            "QQQQQQQQQQQQQQQQQQ",
                            textColor: Styles.baseColor,
                          ),
                        )
                      : type == "word"
                          ? Wrap(
                              children: [
                                MyText.large(
                                  text.split(grammar.grammar ?? "")[0],
                                  fontWeight: Styles.wNormal,
                                  letterSpacing: 0.5,
                                ),
                                MyText.large(grammar.grammar, textColor: Styles.orangeColor),
                                if (grammar.grammar != null && text.split(grammar.grammar!).length > 1)
                                  MyText.large(text.split(grammar.grammar ?? "")[1], fontWeight: Styles.wNormal),
                              ],
                            )
                          : MyText.large(text, fontWeight: Styles.wNormal),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _next() {
    setState(() {
      grammarIndex++;
      grammar = listGrammar[grammarIndex];
    });
  }
}
