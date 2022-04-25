import 'package:flutter/material.dart';
import 'package:diyi/screens/home_screen/components/menu_widget.dart';
import 'package:diyi/utils/constants.dart';

class MenuGroup extends StatelessWidget {
  const MenuGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          for (int i = 0; i < ListMenu.listMenu.length; i++)
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: i == (ListMenu.listMenu.length - 1) ? 0 : 10),
                child: MenuWidget(menu: ListMenu.listMenu[i]),
              ),
            ),
        ],
      ),
    );
  }
}
