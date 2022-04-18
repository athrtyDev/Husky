import 'package:flutter/material.dart';
import 'package:husky/screens/vocabulary_home_screen/components/vocabulary_sub_level.dart';

class VocabularySubLevels extends StatefulWidget {
  const VocabularySubLevels({Key key}) : super(key: key);

  @override
  _VocabularySubLevelsState createState() => _VocabularySubLevelsState();
}

class _VocabularySubLevelsState extends State<VocabularySubLevels> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(15, (index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: VocabularySubLevel(
              index: index + 1,
              isSelected: _selectedIndex == index,
            ),
          );
        }),
      ),
    );
  }
}
