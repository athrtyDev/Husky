import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/utils/constants.dart';

class HomePractice extends StatefulWidget {
  @override
  State<HomePractice> createState() => _HomePracticeState();
}

class _HomePracticeState extends State<HomePractice> {
  final List<String> listBanner = [
    "https://studyinchinas.com/wp-content/uploads/2020/02/Study-in-Beijing-min-798x599.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7adimEWjO8NMlVfBl4_Cez1BlKr2Z51gTTqK_Spicbw4eqnQl0ltiMOiwWfVi4o7I3k&usqp=CAU",
  ];

  int bannerIndex = 0;

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
        else
          Navigator.pushNamed(context, '/practice_screens', arguments: {
            'menu_type': menuType,
            'menu_name': title,
          });
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
