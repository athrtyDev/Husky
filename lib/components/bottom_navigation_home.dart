import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:flutter/material.dart';

class BottomNavigationHome extends StatelessWidget {
  final int currentIndex;
  final Function setIndex;

  BottomNavigationHome({Key key, this.currentIndex, this.setIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 30, top: 15),
      decoration: BoxDecoration(
        color: Styles.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomItem(context, 0, menuList[0].icon, menuList[0].title),
          bottomItem(context, 1, menuList[1].icon, menuList[1].title),
          bottomItem(context, 2, menuList[2].icon, menuList[2].title),
        ],
      ),
    );
  }

  bottomItem(BuildContext context, int index, IconData icon, String label) {
    return InkWell(
        onTap: () {
          setIndex(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Icon(
                icon,
                color: currentIndex == index ? Styles.baseColor : Styles.baseColor.withOpacity(0.5),
                size: 20,
              ),
              SizedBox(height: 5),
              MyText.medium(
                label,
                fontWeight: Styles.wBold,
                textColor: currentIndex == index ? Styles.baseColor : Styles.baseColor.withOpacity(0.5),
              ),
            ],
          ),
        ));
  }

  static final List<TitleWithIconModel> menuList = [
    TitleWithIconModel(title: "????????", icon: Icons.home_rounded),
    TitleWithIconModel(title: "??????", icon: Icons.chat_rounded),
    TitleWithIconModel(title: "????", icon: Icons.person),
  ];
}

class TitleWithIconModel {
  String title;
  IconData icon;

  TitleWithIconModel({this.title, this.icon});
}
