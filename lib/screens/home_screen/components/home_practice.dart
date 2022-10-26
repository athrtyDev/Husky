import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/utils/constants.dart';

class HomePractice extends StatefulWidget {
  @override
  State<HomePractice> createState() => _HomePracticeState();
}

class _HomePracticeState extends State<HomePractice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.large("Дасгал"),
          SizedBox(height: 10),
          exerciseTile("Шинэ үг", MenuType.vocabulary),
          exerciseTile("Дүрэм", MenuType.grammar),
          // exerciseTile("Видео хичээл", MenuType.videoLesson),
        ],
      ),
    );
  }

  Widget exerciseTile(String title, String menuType) {
    return InkWell(
      onTap: () {
        if (menuType == MenuType.videoLesson)
          return;
        else if (menuType == MenuType.grammar) {
          Navigator.pushNamed(context, '/grammar_practice_screens');
        } else {
          Navigator.pushNamed(context, '/practice_screens', arguments: {
            'menu_type': menuType,
            'menu_name': title,
          });
        }
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.only(bottom: 10),
        decoration: Styles.myBoxDecoration,
        child: Row(
          children: [
            Container(
              width: 8,
              decoration: BoxDecoration(
                border: Border.all(color: Styles.baseColor70, width: 2),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            MyText(title),
            Expanded(child: SizedBox()),
            Icon(
              Icons.chevron_right,
              color: Styles.baseColor,
            ),
          ],
        ),
      ),
    );
  }
}
