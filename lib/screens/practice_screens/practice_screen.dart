import 'package:flutter/material.dart';
import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/components/progress_bar.dart';
import 'package:diyi/components/word_big_container.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/practice_provider.dart';
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
    Provider.of<PracticeProvider>(context, listen: false).init(15);
    Provider.of<PracticeProvider>(context, listen: false).correctAnswer = "Аав";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: menuName),
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1),
            child: ProgressBar(
              total: Provider.of<PracticeProvider>(context, listen: false).totalQuestions,
              done: Provider.of<PracticeProvider>(context).currentQuestionIndex,
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
                  WordBigContainer(text: "爸爸", pronunciation: "bàbà"),
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
                        PracticeChoices("Аав"),
                        PracticeChoices("Эрэгтэй"),
                        PracticeChoices("Өвөө"),
                        PracticeChoices("Дуртай"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Button(
                      text: "Дараагийнх",
                      width: 200,
                    ),
                  ),
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
            "${Provider.of<PracticeProvider>(context).correctCount}/${Provider.of<PracticeProvider>(context, listen: false).totalQuestions}",
            textColor: Styles.whiteColor,
            size: 16,
            fontWeight: Styles.wBold,
          ),
        ),
      ],
    );
  }
}
