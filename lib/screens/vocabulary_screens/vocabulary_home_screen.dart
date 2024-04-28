import 'package:diyi/components/level_widget.dart';
import 'package:diyi/components/loader.dart';
import 'package:diyi/components/not_found.dart';
import 'package:diyi/core/classes/VocabularyGroup.dart';
import 'package:diyi/core/classes/VocabularyLevel.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:diyi/components/group_widget.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:provider/provider.dart';

class VocabularyHomeScreen extends StatefulWidget {
  const VocabularyHomeScreen();

  @override
  _VocabularyHomeScreenState createState() => _VocabularyHomeScreenState();
}

class _VocabularyHomeScreenState extends State<VocabularyHomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      VocabularyProvider provider = Provider.of<VocabularyProvider>(context, listen: false);
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
        appBar: myAppBar(title: "Үг цээжлэх"),
        backgroundColor: Styles.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SingleChildScrollView(scrollDirection: Axis.horizontal, child: _levels()),
              Expanded(
                child: Provider.of<VocabularyProvider>(context, listen: true).listSelectedGroup == null
                    ? Loader()
                    : Provider.of<VocabularyProvider>(context, listen: true).listSelectedGroup!.isEmpty
                        ? NotFound()
                        : SingleChildScrollView(child: _groups()),
              ),
            ],
          ),
        ));
  }

  _levels() {
    List<VocabularyLevel>? listLevel = Provider.of<VocabularyProvider>(context, listen: true).listLevel;
    if (listLevel == null) return SizedBox();
    return Row(
      children: [
        for (var level in listLevel)
          InkWell(
            onTap: () {
              Provider.of<VocabularyProvider>(context, listen: false).selectLevel(level.hsk!);
            },
            child: LevelWidget(
              name: "HSK ${level.hsk}",
              total: level.totalVocabulary!,
              isSelected: level.hsk == Provider.of<VocabularyProvider>(context, listen: true).selectedLevel,
              type: "үг",
            ),
          )
      ],
    );
  }

  _groups() {
    List<VocabularyGroup>? listSelectedGroup = Provider.of<VocabularyProvider>(context, listen: true).listSelectedGroup;
    if (listSelectedGroup == null) return SizedBox();
    return Column(
      children: [
        SizedBox(height: 15),
        for (int groupIndex = 0; groupIndex < listSelectedGroup.length; groupIndex++)
          InkWell(
            onTap: () {
              if (Provider.of<UserProvider>(context, listen: false).canAccessVocabulary(groupIndex)) {
                Provider.of<VocabularyProvider>(context, listen: false).selectGroup(listSelectedGroup[groupIndex].groupName!);
                Navigator.pushNamed(context, "/vocabulary_list_screen", arguments: {
                  'headerName':
                      "HSK ${Provider.of<VocabularyProvider>(context, listen: false).selectedLevel} - Бүлэг ${listSelectedGroup[groupIndex].groupName}",
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
              total: listSelectedGroup[groupIndex].totalVocabulary!,
              studied: 0,
              // Бүлэг болгоны эхний 2 үнэгүй
              isPaid: Provider.of<UserProvider>(context, listen: false).canAccessVocabulary(groupIndex),
            ),
          ),
      ],
    );
  }
}
