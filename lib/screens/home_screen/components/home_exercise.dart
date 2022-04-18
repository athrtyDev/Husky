import 'package:flutter/material.dart';
import 'package:husky/components/my_text.dart';
import 'package:husky/global/style.dart';
import 'package:husky/utils/constants.dart';

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
          exerciseTile("Видео хичээл", MenuType.videoLesson),
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
          Navigator.pushNamed(context, '/practice_screen', arguments: {'menu_type': menuType});
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Styles.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Styles.baseColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            )
          ],
        ),
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
