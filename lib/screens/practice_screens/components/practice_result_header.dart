import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/grammar_practice_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PracticeResultHeader extends StatelessWidget {
  const PracticeResultHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<GrammarPracticeProvider>();

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: kToolbarHeight + 10, bottom: 25, left: 30, right: 30),
          decoration: BoxDecoration(
            gradient: Styles.baseGradient,
          ),
          child: Column(
            children: [
              MyText.large(
                "Тестийн хариу",
                textColor: Styles.whiteColor,
                fontWeight: Styles.wSemiBold,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Styles.baseColor20,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Expanded(
                child: CircularPercentIndicator(
                  radius: 45,
                  lineWidth: 10.0,
                  animation: true,
                  percent: provider.totalCorrectAnswers! / provider.totalQuestions!,
                  center: MyText.xlarge(
                    "${(provider.totalCorrectAnswers! / provider.totalQuestions! * 100).ceil()}%",
                    fontWeight: Styles.wSemiBold,
                    textColor: Styles.textColor,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Styles.greenColor,
                  backgroundColor: Styles.greyColor,
                ),
              ),
              Container(height: 70, width: 0.5, color: Styles.textColor50),
              Expanded(
                child: Column(
                  children: [
                    MyText.xlarge(
                      "${provider.totalCorrectAnswers} / ${provider.totalQuestions}",
                      fontWeight: Styles.wSemiBold,
                      textColor: Styles.textColor,
                    ),
                    SizedBox(height: 5),
                    MyText.small(
                      "Зөв / Нийт",
                      fontWeight: Styles.wSemiBold,
                      textColor: Styles.textColor70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
