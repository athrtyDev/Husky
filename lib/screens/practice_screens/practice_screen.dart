import 'package:diyi/components/loader.dart';
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
import 'package:diyi/screens/practice_screens/components/practice_choices.dart';
import 'package:provider/provider.dart';

class PracticeScreen extends StatefulWidget {
  final dynamic args;
  const PracticeScreen({this.args});

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  String menuType;
  String menuName;

  @override
  void initState() {
    super.initState();
    menuType = widget.args['menu_type'];
    menuName = widget.args['menu_name'];
    Future.delayed(Duration.zero, () async {
      await Provider.of<PracticeProvider>(context, listen: false).initTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PracticeModel> listPractice = Provider.of<PracticeProvider>(context, listen: true).listPractice;
    return Scaffold(
      appBar: myAppBar(title: menuName, actions: TtsSpeedIcon(context)),
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
                        WordBigContainer(
                            text: listPractice[Provider.of<PracticeProvider>(context).questionIndex].question,
                            pronunciation: listPractice[Provider.of<PracticeProvider>(context).questionIndex].questionDesc),
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
                              PracticeChoices(
                                  listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex].listChoice[0]),
                              PracticeChoices(
                                  listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex].listChoice[1]),
                              PracticeChoices(
                                  listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex].listChoice[2]),
                              PracticeChoices(
                                  listPractice[Provider.of<PracticeProvider>(context, listen: true).questionIndex].listChoice[3]),
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
                                        Navigator.pushNamed(context, '/practice_result_screens');
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
