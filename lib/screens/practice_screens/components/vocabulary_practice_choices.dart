import 'package:diyi/core/classes/PracticeModel.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:provider/provider.dart';

class VocabularyPracticeChoices extends StatefulWidget {
  final PracticeChoice choice;

  const VocabularyPracticeChoices(this.choice);

  @override
  State<VocabularyPracticeChoices> createState() => _VocabularyPracticeChoicesState();
}

class _VocabularyPracticeChoicesState extends State<VocabularyPracticeChoices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!Provider.of<VocabularyPracticeProvider>(context, listen: false).isAnswered!)
          Provider.of<VocabularyPracticeProvider>(context, listen: false).chooseQuestionVocabulary(widget.choice);
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
              color: Provider.of<VocabularyPracticeProvider>(context).isAnswered ?? false
                  ? (widget.choice.status == ChoiceStatus.correct
                      ? Styles.greenColor
                      : widget.choice.status == ChoiceStatus.wrong
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
              Provider.of<VocabularyPracticeProvider>(context).isAnswered! && widget.choice.status == ChoiceStatus.correct
                  ? Icons.check_circle_rounded
                  : Icons.circle_outlined,
              color: Provider.of<VocabularyPracticeProvider>(context).isAnswered!
                  ? (widget.choice.status == ChoiceStatus.correct
                      ? Styles.greenColor
                      : widget.choice.status == ChoiceStatus.wrong
                          ? Styles.orangeColor
                          : Styles.textColor50)
                  : Styles.textColor50,
              size: 15,
            ),
            SizedBox(width: 25),
            Expanded(
              child: MyText.large(
                widget.choice.text,
                fontWeight: Styles.wNormal,
                textColor: Provider.of<VocabularyPracticeProvider>(context).isAnswered!
                    ? (widget.choice.status == ChoiceStatus.correct
                        ? Styles.greenColor
                        : widget.choice.status == ChoiceStatus.wrong
                            ? Styles.orangeColor
                            : Styles.textColor)
                    : Styles.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
