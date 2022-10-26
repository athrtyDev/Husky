import 'package:diyi/components/loader.dart';
import 'package:diyi/components/tts_speed_icon.dart';
import 'package:diyi/core/classes/PracticeModel.dart';
import 'package:diyi/providers/grammar_practice_model.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:diyi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/components/progress_bar.dart';
import 'package:diyi/components/word_big_container.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/screens/practice_screens/components/practice_choices.dart';
import 'package:provider/provider.dart';

class GrammarPracticeScreen extends StatefulWidget {
  final dynamic args;
  const GrammarPracticeScreen({this.args});

  @override
  _GrammarPracticeScreenState createState() => _GrammarPracticeScreenState();
}

class _GrammarPracticeScreenState extends State<GrammarPracticeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<PracticeProvider>(context, listen: false).initGrammarTest("2");
    });
  }

  @override
  Widget build(BuildContext context) {
    List<GrammarPracticeModel> listPractice = Provider.of<PracticeProvider>(context, listen: true).listGrammarPractice;

    return Scaffold(
      appBar: myAppBar(title: "Дүрэм", actions: TtsSpeedIcon(context)),
      backgroundColor: Styles.whiteColor,
      body: listPractice == null
          ? Loader()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: ProgressBar(
                    total: Provider.of<PracticeProvider>(context, listen: false).totalQuestions,
                    done: Provider.of<PracticeProvider>(context).questionIndex + 1,
                    correct: Provider.of<PracticeProvider>(context).totalCorrectAnswers,
                    width: MediaQuery.of(context).size.width,
                    height: 8,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _status(),
                        SizedBox(height: 15),
                        MyText(
                          listPractice[Provider.of<PracticeProvider>(context).questionIndex].question,
                          textColor: Styles.textColor,
                          size: 25,
                          fontWeight: FontWeight.w200,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration:
                              BoxDecoration(color: Styles.baseColor.withOpacity(0.3), borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PracticeChoices(
                                        listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex]
                                            .listChoice[0]),
                                    PracticeChoices(
                                        listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex]
                                            .listChoice[1]),
                                    if (listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex]
                                        .listChoice[2]
                                        .text
                                        .isNotEmpty)
                                      PracticeChoices(
                                          listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex]
                                              .listChoice[2]),
                                    if (listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex]
                                        .listChoice[3]
                                        .text
                                        .isNotEmpty)
                                      PracticeChoices(
                                          listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex]
                                              .listChoice[3]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                            child: Provider.of<PracticeProvider>(context, listen: true).isAnswered
                                ? Button(
                                    text: (Provider.of<PracticeProvider>(context, listen: false).questionIndex + 1 >=
                                            Provider.of<PracticeProvider>(context, listen: false).totalQuestions)
                                        ? "Дуусгах"
                                        : "Дараагийнх",
                                    width: 200,
                                    onClick: () {
                                      if (Provider.of<PracticeProvider>(context, listen: false).questionIndex + 1 >=
                                          Provider.of<PracticeProvider>(context, listen: false).totalQuestions) {
                                        Navigator.pushNamed(context, '/grammar_practice_result_screens');
                                      } else {
                                        Provider.of<PracticeProvider>(context, listen: false).nextQuestion();
                                      }
                                    },
                                  )
                                : SizedBox()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  _status() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          "Зөв хариулт:",
          textColor: Styles.textColor,
          size: 16,
          fontWeight: Styles.wBold,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          child: MyText(
            "${Provider.of<PracticeProvider>(context).totalCorrectAnswers}/${Provider.of<PracticeProvider>(context, listen: false).totalQuestions}",
            textColor: Styles.whiteColor,
            size: 16,
            fontWeight: Styles.wBold,
          ),
        ),
      ],
    );
  }
}
