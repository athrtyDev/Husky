import 'package:diyi/components/loader.dart';
import 'package:diyi/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/vocabulary_screens/components/vocabulary_list_item.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../providers/vocabulary_provider.dart';

class VocabularyListScreen extends StatefulWidget {
  final dynamic args;
  const VocabularyListScreen({this.args});

  @override
  _VocabularyListScreenState createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends State<VocabularyListScreen> {
  late String headerName;

  @override
  void initState() {
    super.initState();
    headerName = widget.args['headerName'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: headerName),
        backgroundColor: Styles.whiteColor,
        body: Provider.of<VocabularyProvider>(context, listen: true).listSelectedVocabulary == null
            ? Loader()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                            "Нийт ${Provider.of<VocabularyProvider>(context, listen: true).listSelectedVocabulary!.length} үг:",
                            fontWeight: Styles.wBold),
                        testIcon(),
                      ],
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < Provider.of<VocabularyProvider>(context, listen: true).listSelectedVocabulary!.length;
                                i++)
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/vocabulary_detail_screen", arguments: {
                                    'listVocabulary':
                                        Provider.of<VocabularyProvider>(context, listen: false).listSelectedVocabulary,
                                    'index': i,
                                    'title': headerName,
                                  });
                                },
                                child: VocabularyListItem(
                                    vocabulary:
                                        Provider.of<VocabularyProvider>(context, listen: true).listSelectedVocabulary![i]),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }

  Widget testIcon() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/vocabulary_group_practice_screens', arguments: {
          'list_vocabulary': Provider.of<VocabularyProvider>(context, listen: false).listSelectedVocabulary,
          'app_bar_name': headerName,
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Styles.baseColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            MyText("Тест", fontWeight: Styles.wBold),
            SizedBox(width: 5),
            SvgPicture.asset("assets/icons/test.svg", height: 20, width: 20),
          ],
        ),
      ),
    );
  }
}
