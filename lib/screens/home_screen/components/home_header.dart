import 'package:diyi/components/hsk_level_selection.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/components/my_text.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context, listen: false).firebaseUser;
    String? name;
    if (user != null) {
      name = user.displayName;
    }
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
                  MyText.large(name != null ? "Сайн уу, $name" : "Сайн уу",
                      fontWeight: Styles.wSemiBold, textColor: Styles.whiteColor),
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
                  app.appStaticData == null ? "" : app.appStaticData.static!["greeting"] ?? "Энэ өдрийн мэнд",
                  fontWeight: Styles.wNormal,
                  textColor: Styles.whiteColor,
                ),
                // MyText.large(
                //   " 27 ",
                //   fontWeight: Styles.wBold,
                //   textColor: Colors.yellow,
                // ),
                // MyText.large(
                //   "шинэ ",
                //   fontWeight: Styles.wNormal,
                //   textColor: Styles.whiteColor,
                // ),
                // MyText.large(
                //   "үг сурсан байна.",
                //   fontWeight: Styles.wNormal,
                //   textColor: Styles.whiteColor,
                // ),
              ],
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
