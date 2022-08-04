import 'package:diyi/components/button.dart';
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
  Vocabulary vocabulary;
  List<Vocabulary> listVocabulary;
  int vocabularyIndex;
  String title;

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
      appBar: myAppBar(title: title),
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
                      text: vocabulary.word,
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
                            _exampleWidget(vocabulary.example1, vocabulary.example1Pronunciation, vocabulary.example1Translation),
                          SizedBox(height: 20),
                          if (vocabulary.example2 != null && vocabulary.example2 != "")
                            _exampleWidget(vocabulary.example2, vocabulary.example2Pronunciation, vocabulary.example2Translation),
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
                        onClick: _next,
                      )
                    : Button.disabled(
                        text: "Дараагийнх",
                      )),
          ],
        ),
      ),
    );
  }

  Widget _exampleWidget(String example, String pronunciation, String translation) {
    return InkWell(
      onTap: () => Provider.of<TtsProvider>(context, listen: false).speak(example),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                exampleStepper("first", example),
                exampleStepper("", pronunciation),
                exampleStepper("last", translation),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.record_voice_over_rounded,
              color: Styles.baseColor,
            ),
          )
        ],
      ),
    );
  }

  exampleStepper(String type, String text) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 20,
            child: Column(
              children: [
                type == "first"
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
                type == "last"
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
            child: Container(
              padding: EdgeInsets.only(bottom: 25, top: 5, left: 10, right: 10),
              child: type == "first"
                  ? Wrap(
                      children: [
                        MyText.large(
                          text.split(vocabulary.word)[0] ?? "",
                          fontWeight: Styles.wNormal,
                          letterSpacing: 0.5,
                        ),
                        MyText.large(vocabulary.word, textColor: Styles.orangeColor),
                        MyText.large(text.split(vocabulary.word)[1] ?? "", fontWeight: Styles.wNormal),
                      ],
                    )
                  : MyText.large(text ?? "", fontWeight: Styles.wNormal),
            ),
          )
        ],
      ),
    );
  }

  _next() {
    setState(() {
      vocabularyIndex++;
      vocabulary = listVocabulary[vocabularyIndex];
    });
  }
}
