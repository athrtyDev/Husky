import 'package:diyi/components/tts_speed_icon.dart';
import 'package:diyi/core/classes/PracticeModel.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/components/progress_bar.dart';
import 'package:diyi/components/word_big_container.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/screens/practice_screens/components/vocabulary_practice_choices.dart';
import 'package:provider/provider.dart';

class VocabularyGroupPracticeScreen extends StatefulWidget {
  final dynamic args;
  const VocabularyGroupPracticeScreen({this.args});

  @override
  _VocabularyGroupPracticeScreenState createState() => _VocabularyGroupPracticeScreenState();
}

class _VocabularyGroupPracticeScreenState extends State<VocabularyGroupPracticeScreen> {
  late String appbarName;
  late List<dynamic> listVocabulary;

  @override
  void initState() {
    super.initState();
    appbarName = widget.args['app_bar_name'];
    listVocabulary = widget.args['list_vocabulary'];
    Future.delayed(Duration.zero, () async {
      Provider.of<VocabularyPracticeProvider>(context, listen: false).initGroupPractice(listVocabulary);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PracticeModel>? listPractice = Provider.of<VocabularyPracticeProvider>(context, listen: true).listVocabularyPractice;
    return Scaffold(
      appBar: myAppBar(title: appbarName, actions: TtsSpeedIcon(context)),
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1),
            child: ProgressBar(
              total: Provider.of<VocabularyPracticeProvider>(context, listen: false).totalQuestions!,
              done: Provider.of<VocabularyPracticeProvider>(context).questionIndex! + 1,
              correct: Provider.of<VocabularyPracticeProvider>(context).totalCorrectAnswers,
              width: MediaQuery.of(context).size.width,
              height: 8,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _status(),
                    SizedBox(height: 15),
                    WordBigContainer(
                      text: listPractice![Provider.of<VocabularyPracticeProvider>(context).questionIndex!].question!,
                      pronunciation: listPractice[Provider.of<VocabularyPracticeProvider>(context).questionIndex!].questionDesc,
                      textSize: 30,
                    ),
                    SizedBox(height: 20),
                    MyText(
                      "Сонголтууд",
                      textColor: Styles.textColor,
                      size: 16,
                      fontWeight: Styles.wBold,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VocabularyPracticeChoices(
                              listPractice[Provider.of<VocabularyPracticeProvider>(context).questionIndex!].listChoice![0]),
                          VocabularyPracticeChoices(
                              listPractice[Provider.of<VocabularyPracticeProvider>(context).questionIndex!].listChoice![1]),
                          VocabularyPracticeChoices(
                              listPractice[Provider.of<VocabularyPracticeProvider>(context).questionIndex!].listChoice![2]),
                          VocabularyPracticeChoices(
                              listPractice[Provider.of<VocabularyPracticeProvider>(context).questionIndex!].listChoice![3]),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                        child: Provider.of<VocabularyPracticeProvider>(context).isAnswered!
                            ? Button(
                                text: (Provider.of<VocabularyPracticeProvider>(context, listen: false).questionIndex! + 1 >=
                                        Provider.of<VocabularyPracticeProvider>(context, listen: false).totalQuestions!)
                                    ? "Дуусгах"
                                    : "Дараагийнх",
                                width: 200,
                                onClick: () {
                                  if (Provider.of<VocabularyPracticeProvider>(context, listen: false).questionIndex! + 1 >=
                                      Provider.of<VocabularyPracticeProvider>(context, listen: false).totalQuestions!) {
                                    Navigator.pushNamed(context, '/practice_result_screens');
                                  } else {
                                    Provider.of<VocabularyPracticeProvider>(context, listen: false).nextQuestion();
                                  }
                                },
                              )
                            : SizedBox()),
                  ],
                ),
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
            "${Provider.of<VocabularyPracticeProvider>(context).totalCorrectAnswers}/${Provider.of<VocabularyPracticeProvider>(context).totalQuestions}",
            textColor: Styles.whiteColor,
            size: 16,
            fontWeight: Styles.wBold,
          ),
        ),
      ],
    );
  }
}
