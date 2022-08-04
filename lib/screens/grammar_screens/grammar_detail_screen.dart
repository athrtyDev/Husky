import 'package:diyi/components/button.dart';
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
  Grammar grammar;
  List<Grammar> listGrammar;
  int grammarIndex;
  String title;

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
                      text: grammar.grammar,
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
                            child: MyText.large(grammar.translation, fontWeight: Styles.wSemiBold),
                          ),
                          SizedBox(height: 40),
                          if (grammar.example1 != null && grammar.example1 != "")
                            MyText.large("Жишээ өгүүлбэр:", fontWeight: Styles.wSemiBold),
                          SizedBox(height: 20),
                          if (grammar.example1 != null && grammar.example1 != "")
                            _exampleWidget(grammar.example1, grammar.example1Pronunciation, grammar.example1Translation),
                          SizedBox(height: 20),
                          if (grammar.example2 != null && grammar.example2 != "")
                            _exampleWidget(grammar.example2, grammar.example2Pronunciation, grammar.example2Translation),
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
              padding: EdgeInsets.only(bottom: 15, top: 5, left: 10, right: 10),
              child: type == "first"
                  ? Wrap(
                      children: [
                        MyText.large(
                          text.split(grammar.grammar)[0] ?? "",
                          fontWeight: Styles.wNormal,
                          letterSpacing: 0.5,
                        ),
                        MyText.large(grammar.grammar, textColor: Styles.orangeColor),
                        MyText.large(text.split(grammar.grammar)[1] ?? "", fontWeight: Styles.wNormal),
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
      grammarIndex++;
      grammar = listGrammar[grammarIndex];
    });
  }
}
