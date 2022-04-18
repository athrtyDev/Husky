import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/global/global.dart';

class VocabularyDetailScreen extends StatefulWidget {
  final dynamic args;
  const VocabularyDetailScreen({Key key, this.args}) : super(key: key);

  @override
  _VocabularyDetailScreenState createState() => _VocabularyDetailScreenState();
}

class _VocabularyDetailScreenState extends State<VocabularyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Шинэ үг"),
      backgroundColor: Styles.greyColor,
      body: Column(
        children: [
          _wordWidget(),
          _exampleWidget(),
          SizedBox(
            height: 20,
          ),
          _exampleWidget(),
        ],
      ),
    );
  }

  Widget _wordWidget() {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Styles.whiteColor),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    //   margin: EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(color: Styles.whiteColor, borderRadius: BorderRadius.circular(20)),
                    //   child: MyText.medium("n"),
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          "三",
                          textColor: Styles.textColor,
                          size: 32,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MyText.medium(
                          "san",
                          textColor: Styles.textColor,
                          fontWeight: Styles.wSemiBold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MyText.medium(
                          "Гурав",
                          textColor: Styles.baseColor,
                          fontWeight: Styles.wBold,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(10)),
                      child: MyText.small(
                        "Нэр үг",
                        textColor: Styles.whiteColor,
                      ),
                    )
                  ],
                ),
                Container(
                  child: Icon(
                    Icons.record_voice_over_rounded,
                    color: Styles.baseColor,
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget _exampleWidget() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                CustomStepper(type: "first", text: "San shi ba"),
                CustomStepper(type: "", text: "三十八"),
                CustomStepper(type: "last", text: "Гучин найм"),
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Icon(
            Icons.record_voice_over_rounded,
            color: Styles.baseColor,
          ),
        )
      ],
    ));
  }
}

class CustomStepper extends StatelessWidget {
  const CustomStepper({Key key, this.type, this.text}) : super(key: key);
  final String type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  width: 15,
                  height: 15,
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
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(bottom: 15, top: 5, left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.25,
            child: MyText.medium(text),
          )
        ],
      ),
    );
  }
}
