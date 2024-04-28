import 'package:diyi/components/group_widget.dart';
import 'package:diyi/components/level_widget.dart';
import 'package:diyi/components/loader.dart';
import 'package:diyi/components/not_found.dart';
import 'package:diyi/core/classes/GrammarGroup.dart';
import 'package:diyi/core/classes/GrammarLevel.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/grammar_provider.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:provider/provider.dart';

class GrammarHomeScreen extends StatefulWidget {
  const GrammarHomeScreen();

  @override
  _GrammarHomeScreenState createState() => _GrammarHomeScreenState();
}

class _GrammarHomeScreenState extends State<GrammarHomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      GrammarProvider provider = Provider.of<GrammarProvider>(context, listen: false);
      await provider.cacheAllData();
      if (Provider.of<UserProvider>(context, listen: false).loggedUser == null ||
          Provider.of<UserProvider>(context, listen: false).loggedUser!.hsk == null) {
        provider.selectLevel("1");
      } else {
        provider.selectLevel(Provider.of<UserProvider>(context, listen: false).loggedUser!.hsk!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "Дүрэм"),
        backgroundColor: Styles.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SingleChildScrollView(scrollDirection: Axis.horizontal, child: _levels()),
              Expanded(
                  child: Provider.of<GrammarProvider>(context, listen: true).listSelectedGroup == null
                      ? Loader()
                      : Provider.of<GrammarProvider>(context, listen: true).listSelectedGroup!.isEmpty
                          ? NotFound()
                          : SingleChildScrollView(child: _groups())),
            ],
          ),
        ));
  }

  _levels() {
    List<GrammarLevel>? listLevel = Provider.of<GrammarProvider>(context, listen: true).listLevel;
    if (listLevel == null) return SizedBox();
    return Row(
      children: [
        for (var level in listLevel)
          InkWell(
            onTap: () {
              Provider.of<GrammarProvider>(context, listen: false).selectLevel(level.hsk!);
            },
            child: LevelWidget(
              name: "HSK ${level.hsk}",
              total: level.totalGrammar!,
              isSelected: level.hsk == Provider.of<GrammarProvider>(context, listen: true).selectedLevel,
              type: "дүрэм",
            ),
          )
      ],
    );
  }

  _groups() {
    List<GrammarGroup>? listSelectedGroup = Provider.of<GrammarProvider>(context, listen: true).listSelectedGroup;
    return Column(
      children: [
        SizedBox(height: 15),
        for (int groupIndex = 0; groupIndex < listSelectedGroup!.length; groupIndex++)
          InkWell(
            onTap: () {
              if (Provider.of<UserProvider>(context, listen: false).canAccessGrammar(groupIndex)) {
                Provider.of<GrammarProvider>(context, listen: false).selectGroup(listSelectedGroup[groupIndex].groupName!);
                Navigator.pushNamed(context, "/grammar_list_screen", arguments: {
                  'headerName':
                      "HSK ${Provider.of<GrammarProvider>(context, listen: false).selectedLevel} - Бүлэг ${listSelectedGroup[groupIndex].groupName}",
                });
              } else {
                if (Provider.of<UserProvider>(context, listen: false).loggedUser == null)
                  Navigator.pushNamed(context, "/main", arguments: {'defaultTab': 1});
                else
                  Navigator.pushNamed(context, '/payment_choice_screen');
              }
            },
            child: GroupWidget(
              name: "Бүлэг ${listSelectedGroup[groupIndex].groupName}",
              total: listSelectedGroup[groupIndex].totalGrammar!,
              studied: 0,
              // Provider.of<UserProvider>(context, listen: false).is
              isPaid: Provider.of<UserProvider>(context, listen: false).canAccessGrammar(groupIndex),
            ),
          ),
      ],
    );
  }
}
