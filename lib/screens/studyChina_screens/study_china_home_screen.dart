import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/core/classes/StudyInChina.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/study_china_provider.dart';
import 'package:diyi/screens/coming_soon_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudyChinaHomeScreen extends StatefulWidget {
  const StudyChinaHomeScreen();

  @override
  _StudyChinaHomeScreenState createState() => _StudyChinaHomeScreenState();
}

class _StudyChinaHomeScreenState extends State<StudyChinaHomeScreen> {
  int selectedIndex = 0;
  List<StudyInChinaModel> listData;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      StudyChinaProvider provider = Provider.of<StudyChinaProvider>(context, listen: false);
      await provider.cacheAllData();
      setState(() {
        listData = provider.studyChina;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "БНХАУ-д сурах", color: Styles.greyColor),
      backgroundColor: Styles.greyColor,
      body: listData != null && listData.isNotEmpty
          ? Column(
              children: [
                // studyInChinaV1(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [for (int index = 0; index < listData.length; index++) _tab(listData[index].groupName, index)],
                    ),
                  ),
                ),
                if (listData[selectedIndex].groupData != null && listData[selectedIndex].groupData.isNotEmpty)
                  Expanded(child: studyInChinaGrid(listData[selectedIndex].groupData))
              ],
            )
          : SizedBox(),
    );
  }

  Widget _tab(String title, index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: selectedIndex == index ? Styles.baseColor : Styles.whiteColor, borderRadius: BorderRadius.circular(5)),
        child: MyText.medium(title, textColor: selectedIndex == index ? Styles.whiteColor : null),
      ),
    );
  }

  studyInChinaTile(String title) {
    final List<String> listBanner = [
      "https://i.pinimg.com/736x/db/ac/32/dbac32146104c67946de2a6d857a57c0.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7adimEWjO8NMlVfBl4_Cez1BlKr2Z51gTTqK_Spicbw4eqnQl0ltiMOiwWfVi4o7I3k&usqp=CAU",
      "https://i.pinimg.com/736x/bf/06/3a/bf063a19d01d5fbdf38a8fd72c723815.jpg",
    ];
    final List<String> listTitle = [
      "Яагаад заавал БНХАУ гэж?",
      "БНХАУ -н боловсрол",
      "Гадаад оюутны амьдрал",
    ];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(
                top: 5,
                bottom: 10,
                left: 10,
              ),
              child: MyText.large(title)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var index = 0; index < 3; index++)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(color: Styles.whiteColor, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: listBanner[index],
                            fit: BoxFit.cover,
                            height: 120,
                            width: 200,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: MyText.medium(listTitle[index]),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  studyInChinaGrid(List<GroupData> groupData) {
    return Container(
      padding: EdgeInsets.all(5),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: groupData.length,
        itemBuilder: (BuildContext context, int index) {
          if (index > 2) {
            index = 1;
          }
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/studyChina_detail_screen', arguments: {
                "title": groupData[index].bannerTitle,
                "image": groupData[index].detailImage,
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(color: Styles.whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: groupData[index].bannerImage,
                      fit: BoxFit.cover,
                      height: 130,
                      width: 200,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: MyText.medium(
                        groupData[index].bannerTitle,
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
