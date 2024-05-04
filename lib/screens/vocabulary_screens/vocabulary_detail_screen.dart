import 'dart:ui';
import 'package:diyi/components/button.dart';
import 'package:diyi/components/tts_speed_icon.dart';
import 'package:diyi/components/voice_icon.dart';
import 'package:diyi/components/word_big_container.dart';
import 'package:diyi/core/classes/Vocabulary.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:provider/provider.dart';

class VocabularyDetailScreen extends StatefulWidget {
  final dynamic args;
  const VocabularyDetailScreen({this.args});

  @override
  _VocabularyDetailScreenState createState() => _VocabularyDetailScreenState();
}

class _VocabularyDetailScreenState extends State<VocabularyDetailScreen> {
  late Vocabulary vocabulary;
  late List<Vocabulary> listVocabulary;
  late int vocabularyIndex;
  late String title;

  @override
  void initState() {
    super.initState();
    listVocabulary = widget.args['listVocabulary'];
    vocabularyIndex = widget.args['index'];
    vocabulary = listVocabulary[vocabularyIndex];
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
                      text: vocabulary.word!,
                      pronunciation: vocabulary.pronunciation,
                      translation: vocabulary.translation,
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (vocabulary.example1 != null && vocabulary.example1 != "")
                            MyText.large("Жишээ өгүүлбэр:", fontWeight: Styles.wSemiBold),
                          SizedBox(height: 20),
                          if (vocabulary.example1 != null && vocabulary.example1 != "")
                            _exampleWidget(
                              vocabulary.example1!,
                              vocabulary.example1Pronunciation!,
                              vocabulary.example1Translation!,
                            ),
                          SizedBox(height: 20),
                          if (vocabulary.example2 != null && vocabulary.example2 != "")
                            _exampleWidget(
                              vocabulary.example2!,
                              vocabulary.example2Pronunciation!,
                              vocabulary.example2Translation!,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 25),
              child: vocabularyIndex < (listVocabulary.length - 1)
                  ? Button(
                      text: "Дараагийнх",
                      onClick: () {
                        next();
                      },
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

  Widget _exampleWidget(String example, String pronunciation, String translation) {
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
                () {},
              ),
              exampleStepper(
                "pronunciation",
                pronunciation,
                Provider.of<TtsProvider>(context, listen: true).hidePronunciation,
                () {
                  Provider.of<TtsProvider>(context, listen: false).switchPronunciation();
                },
              ),
              exampleStepper(
                "translation",
                translation,
                Provider.of<TtsProvider>(context, listen: true).hideTranslation,
                () {
                  Provider.of<TtsProvider>(context, listen: false).switchTranslation();
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
                  sigmaX: isBlur ? 0 : 0,
                  sigmaY: isBlur ? 0 : 0,
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 25, top: 5, left: 10, right: 10),
                  child: isBlur
                      ? MyText.large(
                          type == "translation" ? "Орчуулгах харах" : "Дуудлага харах",
                          textColor: Styles.baseColor,
                          fontWeight: Styles.wNormal,
                        )
                      : type == "word"
                          ? Wrap(
                              children: [
                                MyText.large(
                                  text.split(vocabulary.word!)[0] ?? "",
                                  fontWeight: Styles.wNormal,
                                  textColor: Styles.baseColor,
                                  letterSpacing: 0.5,
                                ),
                                if (text.contains(vocabulary.word!)) MyText.large(vocabulary.word, textColor: Styles.orangeColor),
                                if (text.split(vocabulary.word!).length > 1)
                                  MyText.large(
                                    text.split(vocabulary.word!)[1] ?? "",
                                    fontWeight: Styles.wNormal,
                                    textColor: Styles.baseColor,
                                  ),
                              ],
                            )
                          : MyText.large(
                              text ?? "",
                              fontWeight: Styles.wSemiBold,
                              textColor: Styles.baseColor,
                            ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void next() {
    setState(() {
      vocabularyIndex++;
      vocabulary = listVocabulary[vocabularyIndex];
    });
  }
}
