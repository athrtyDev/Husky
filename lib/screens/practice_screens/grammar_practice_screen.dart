import 'package:diyi/components/loader.dart';
import 'package:diyi/components/not_found.dart';
import 'package:diyi/components/tts_speed_icon.dart';
import 'package:diyi/providers/grammar_practice_model.dart';
import 'package:diyi/providers/grammar_practice_provider.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/components/progress_bar.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/screens/practice_screens/components/grammar_practice_choices.dart';
import 'package:provider/provider.dart';

class GrammarPracticeScreen extends StatefulWidget {
  final dynamic args;
  const GrammarPracticeScreen({this.args});

  @override
  _GrammarPracticeScreenState createState() => _GrammarPracticeScreenState();
}

class _GrammarPracticeScreenState extends State<GrammarPracticeScreen> {
  String hskLevel = "";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (Provider.of<UserProvider>(context, listen: false).loggedUser == null ||
          Provider.of<UserProvider>(context, listen: false).loggedUser!.hsk == null) {
        hskLevel = "1";
        await Provider.of<GrammarPracticeProvider>(context, listen: false).initGrammarTest(hskLevel);
      } else {
        hskLevel = Provider.of<UserProvider>(context, listen: false).loggedUser!.hsk!;
        await Provider.of<GrammarPracticeProvider>(context, listen: false).initGrammarTest(hskLevel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<GrammarPracticeModel>? listPractice = Provider.of<GrammarPracticeProvider>(context, listen: true).listGrammarPractice;

    return Scaffold(
      appBar: myAppBar(title: "Дүрэм", actions: TtsSpeedIcon(context)),
      backgroundColor: Styles.whiteColor,
      body: listPractice == null && !Provider.of<GrammarPracticeProvider>(context, listen: true).isGrammarEmpty
          ? Loader()
          : listPractice == null && Provider.of<GrammarPracticeProvider>(context, listen: true).isGrammarEmpty
              ? Center(child: NotFound(text: "HSK ${hskLevel} түвшний дасгал байхгүй байна."))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: ProgressBar(
                        total: Provider.of<GrammarPracticeProvider>(context, listen: false).totalQuestions!,
                        done: Provider.of<GrammarPracticeProvider>(context).questionIndex! + 1,
                        correct: Provider.of<GrammarPracticeProvider>(context).totalCorrectAnswers,
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
                              listPractice![Provider.of<GrammarPracticeProvider>(context).questionIndex!].question!,
                              textColor: Styles.textColor,
                              size: 25,
                              fontWeight: FontWeight.w200,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                  color: Styles.baseColor.withOpacity(0.3), borderRadius: BorderRadius.circular(10)),
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
                                        GrammarPracticeChoices(listPractice[
                                                Provider.of<GrammarPracticeProvider>(context, listen: true).questionIndex!]
                                            .listChoice![0]),
                                        GrammarPracticeChoices(listPractice[
                                                Provider.of<GrammarPracticeProvider>(context, listen: true).questionIndex!]
                                            .listChoice![1]),
                                        if (listPractice[
                                                Provider.of<GrammarPracticeProvider>(context, listen: true).questionIndex!]
                                            .listChoice![2]
                                            .text!
                                            .isNotEmpty)
                                          GrammarPracticeChoices(listPractice[
                                                  Provider.of<GrammarPracticeProvider>(context, listen: true).questionIndex!]
                                              .listChoice![2]),
                                        if (listPractice[
                                                Provider.of<GrammarPracticeProvider>(context, listen: true).questionIndex!]
                                            .listChoice![3]
                                            .text!
                                            .isNotEmpty)
                                          GrammarPracticeChoices(listPractice[
                                                  Provider.of<GrammarPracticeProvider>(context, listen: true).questionIndex!]
                                              .listChoice![3]),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                                child: Provider.of<GrammarPracticeProvider>(context, listen: true).isAnswered!
                                    ? Button(
                                        text: (Provider.of<GrammarPracticeProvider>(context, listen: false).questionIndex! + 1 >=
                                                Provider.of<GrammarPracticeProvider>(context, listen: false).totalQuestions!)
                                            ? "Дуусгах"
                                            : "Дараагийнх",
                                        width: 200,
                                        onClick: () {
                                          if (Provider.of<GrammarPracticeProvider>(context, listen: false).questionIndex! + 1 >=
                                              Provider.of<GrammarPracticeProvider>(context, listen: false).totalQuestions!) {
                                            Navigator.pushNamed(context, '/grammar_practice_result_screens');
                                          } else {
                                            Provider.of<GrammarPracticeProvider>(context, listen: false).nextQuestion();
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
            "${Provider.of<GrammarPracticeProvider>(context).totalCorrectAnswers}/${Provider.of<GrammarPracticeProvider>(context, listen: false).totalQuestions}",
            textColor: Styles.whiteColor,
            size: 16,
            fontWeight: Styles.wBold,
          ),
        ),
      ],
    );
  }
}
