import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/screens/vocabulary_home_screen/components/vocabulary_sub_level.dart';
import 'package:provider/provider.dart';

class VocabularySubLevels extends StatefulWidget {
  const VocabularySubLevels({Key key}) : super(key: key);

  @override
  _VocabularySubLevelsState createState() => _VocabularySubLevelsState();
}

class _VocabularySubLevelsState extends State<VocabularySubLevels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(Provider.of<VocabularyProvider>(context).listGroup.length, (index) {
          return VocabularySubLevel(
            name: Provider.of<VocabularyProvider>(context).listGroup[index].name,
            listVocabulary: Provider.of<VocabularyProvider>(context).listGroup[index].listVocabulary,
          );
        }),
      ),
    );
  }
}
