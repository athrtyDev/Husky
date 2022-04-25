import 'package:flutter/material.dart';
import 'package:diyi/components/hsk_level_selection.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/components/my_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 60),
      decoration: BoxDecoration(
          gradient: Styles.baseGradient,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(30, 15),
            bottomLeft: Radius.elliptical(30, 15),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MyText.large("Сайн уу, Дэлгэрэх", fontWeight: Styles.wSemiBold, textColor: Styles.whiteColor),
                  SizedBox(width: 5),
                  Image.asset(
                    "assets/images/ic_wave_hand.png",
                    height: 20,
                  ),
                ],
              ),
              HskLevelSelection(),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Wrap(
              children: [
                MyText.large(
                  "Энэ долоо хоногт",
                  fontWeight: Styles.wNormal,
                  textColor: Styles.whiteColor,
                ),
                MyText.large(
                  " 27 ",
                  fontWeight: Styles.wBold,
                  textColor: Colors.yellow,
                ),
                MyText.large(
                  "шинэ ",
                  fontWeight: Styles.wNormal,
                  textColor: Styles.whiteColor,
                ),
                MyText.large(
                  "үг сурсан байна.",
                  fontWeight: Styles.wNormal,
                  textColor: Styles.whiteColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
