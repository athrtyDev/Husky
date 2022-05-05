import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/practice_provider.dart';
import 'package:provider/provider.dart';

class PracticeChoices extends StatefulWidget {
  final String text;

  const PracticeChoices(this.text);

  @override
  State<PracticeChoices> createState() => _PracticeChoicesState();
}

class _PracticeChoicesState extends State<PracticeChoices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<PracticeProvider>(context, listen: false).chooseAnswer(widget.text);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          color: Styles.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              width: 2,
              color: Provider.of<PracticeProvider>(context).isChoiceSelected
                  ? (Provider.of<PracticeProvider>(context).correctAnswer == widget.text
                      ? Styles.greenColor
                      : (Provider.of<PracticeProvider>(context).selectedAnswer == widget.text &&
                              Provider.of<PracticeProvider>(context).selectedAnswer !=
                                  Provider.of<PracticeProvider>(context).correctAnswer)
                          ? Styles.orangeColor
                          : Styles.whiteColor)
                  : Styles.whiteColor),
          boxShadow: [
            BoxShadow(
              color: Styles.textColor10,
              offset: Offset(2, 4),
              spreadRadius: 0,
              blurRadius: 8,
            )
          ],
        ),
        child: Row(
          children: [
            Icon(
              Provider.of<PracticeProvider>(context).isChoiceSelected
                  ? (Provider.of<PracticeProvider>(context).correctAnswer == widget.text
                      ? Icons.check_circle_rounded
                      : Icons.circle_outlined)
                  : Icons.circle_outlined,
              color: Provider.of<PracticeProvider>(context).isChoiceSelected
                  ? (Provider.of<PracticeProvider>(context).correctAnswer == widget.text
                      ? Styles.greenColor
                      : (Provider.of<PracticeProvider>(context).selectedAnswer == widget.text &&
                              Provider.of<PracticeProvider>(context).selectedAnswer !=
                                  Provider.of<PracticeProvider>(context).correctAnswer)
                          ? Styles.orangeColor
                          : Styles.textColor50)
                  : Styles.textColor50,
              size: 15,
            ),
            SizedBox(width: 25),
            MyText.large(
              widget.text,
              fontWeight: Styles.wSemiBold,
              textColor: Provider.of<PracticeProvider>(context).isChoiceSelected
                  ? (Provider.of<PracticeProvider>(context).correctAnswer == widget.text
                      ? Styles.greenColor
                      : (Provider.of<PracticeProvider>(context).selectedAnswer == widget.text &&
                              Provider.of<PracticeProvider>(context).selectedAnswer !=
                                  Provider.of<PracticeProvider>(context).correctAnswer)
                          ? Styles.orangeColor
                          : Styles.textColor)
                  : Styles.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
