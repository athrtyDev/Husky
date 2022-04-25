import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class GrammarDetailScreen extends StatefulWidget {
  final dynamic args;
  const GrammarDetailScreen({Key key, this.args}) : super(key: key);

  @override
  _GrammarDetailScreenState createState() => _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends State<GrammarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Дүрэм"),
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
                        Container(
                          width: 32,
                          child: MyText.medium(
                            "shi",
                            textColor: Styles.textColor,
                            fontWeight: Styles.wSemiBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MyText(
                          "貞",
                          textColor: Styles.textColor,
                          size: 32,
                        ),
                      ],
                    ),
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
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              decoration: BoxDecoration(color: Styles.baseColor, borderRadius: BorderRadius.circular(5)),
              child: MyText(
                "Дүрмийн тайлбар ийм учиртай. \n1.Үг холбоно.\n2.Дагавар",
                textColor: Styles.whiteColor,
                size: 11,
                height: 1.7,
              ),
            )
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
                CustomStepper(type: "first", text: "We shi"),
                CustomStepper(type: "", text: "私中国人"),
                CustomStepper(type: "last", text: "Би хятад хүн"),
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
