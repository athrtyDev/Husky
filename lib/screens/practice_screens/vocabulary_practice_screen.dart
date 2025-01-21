import 'package:diyi/components/loader.dart';
import 'package:diyi/components/not_found.dart';
import 'package:diyi/components/tts_speed_icon.dart';
import 'package:diyi/core/classes/PracticeModel.dart';
import 'package:diyi/providers/user_provider.dart';
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

class VocabularyPracticeScreen extends StatefulWidget {
  final dynamic args;
  const VocabularyPracticeScreen({this.args});

  @override
  _VocabularyPracticeScreenState createState() => _VocabularyPracticeScreenState();
}

class _VocabularyPracticeScreenState extends State<VocabularyPracticeScreen> {
  late String menuType;
  late String menuName;
  String hskLevel = "";

  @override
  void initState() {
    super.initState();
    menuType = widget.args['menu_type'];
    menuName = widget.args['menu_name'];
    Future.delayed(Duration.zero, () async {
      if (Provider.of<UserProvider>(context, listen: false).loggedUser == null ||
          Provider.of<UserProvider>(context, listen: false).loggedUser!.hsk == null) {
        hskLevel = "1";
        await Provider.of<VocabularyPracticeProvider>(context, listen: false).initVocabularyTest(hskLevel);
      } else {
        hskLevel = Provider.of<UserProvider>(context, listen: false).loggedUser!.hsk!;
        await Provider.of<VocabularyPracticeProvider>(context, listen: false).initVocabularyTest(hskLevel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PracticeModel>? listPractice = Provider.of<VocabularyPracticeProvider>(context, listen: true).listVocabularyPractice;
    return Scaffold(
      appBar: myAppBar(title: menuName, actions: TtsSpeedIcon(context)),
      backgroundColor: Styles.whiteColor,
      body: listPractice == null
          ? Loader()
          : listPractice.isEmpty
              ? Center(child: NotFound(text: "HSK ${hskLevel} түвшний дасгал байхгүй байна."))
              : Column(
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
                                text: listPractice[Provider.of<VocabularyPracticeProvider>(context).questionIndex!].question!,
                                pronunciation:
                                    listPractice[Provider.of<VocabularyPracticeProvider>(context).questionIndex!].questionDesc,
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
                                    VocabularyPracticeChoices(listPractice[
                                            Provider.of<VocabularyPracticeProvider>(context, listen: true).questionIndex!]
                                        .listChoice![0]),
                                    VocabularyPracticeChoices(listPractice[
                                            Provider.of<VocabularyPracticeProvider>(context, listen: true).questionIndex!]
                                        .listChoice![1]),
                                    VocabularyPracticeChoices(listPractice[
                                            Provider.of<VocabularyPracticeProvider>(context, listen: true).questionIndex!]
                                        .listChoice![2]),
                                    VocabularyPracticeChoices(listPractice[
                                            Provider.of<VocabularyPracticeProvider>(context, listen: true).questionIndex!]
                                        .listChoice![3]),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                  child: Provider.of<VocabularyPracticeProvider>(context, listen: true).isAnswered!
                                      ? Button(
                                          text: (Provider.of<VocabularyPracticeProvider>(context, listen: false).questionIndex! +
                                                      1 >=
                                                  Provider.of<VocabularyPracticeProvider>(context, listen: false).totalQuestions!)
                                              ? "Дуусгах"
                                              : "Дараагийнх",
                                          width: 200,
                                          onClick: () {
                                            if (Provider.of<VocabularyPracticeProvider>(context, listen: false).questionIndex! +
                                                    1 >=
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
            "${Provider.of<VocabularyPracticeProvider>(context).totalCorrectAnswers}/${Provider.of<VocabularyPracticeProvider>(context, listen: false).totalQuestions}",
            textColor: Styles.whiteColor,
            size: 16,
            fontWeight: Styles.wBold,
          ),
        ),
      ],
    );
  }
}
