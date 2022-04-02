import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:husky/global/global.dart';
import 'package:husky/components/my_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/images/ic_menu.svg",
                color: Styles.textColor70,
                height: 30,
              ),
              SizedBox(height: 20),
              MyText.large("Сайн уу, Хулан", fontWeight: Styles.wSemiBold),
              SizedBox(height: 10),
              Wrap(
                children: [
                  MyText.large(
                    "Энэ 7 хоногт",
                    fontWeight: Styles.wNormal,
                    textColor: Styles.textColor,
                  ),
                  MyText.large(
                    " 27 ",
                    fontWeight: Styles.wNormal,
                    textColor: Styles.orangeColor,
                  ),
                  MyText.large(
                    "шинэ ",
                    fontWeight: Styles.wNormal,
                    textColor: Styles.textColor,
                  ),
                  MyText.large(
                    "үг сурсан байна.",
                    fontWeight: Styles.wNormal,
                    textColor: Styles.textColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 5),
        Image.asset(
          "assets/images/bg_home_header.png",
          height: 180,
        ),
      ],
    );
  }
}
