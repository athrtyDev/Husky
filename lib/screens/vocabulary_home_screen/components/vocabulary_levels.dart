import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/screens/vocabulary_home_screen/components/vocabulary_level.dart';
import 'package:provider/provider.dart';

class VocabularyLevels extends StatefulWidget {
  const VocabularyLevels({Key key}) : super(key: key);

  @override
  _VocabularyLevelsState createState() => _VocabularyLevelsState();
}

class _VocabularyLevelsState extends State<VocabularyLevels> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          for (int index = 0; index < 6; index++)
            InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                Provider.of<VocabularyProvider>(context, listen: false).getGroupList((index + 1).toString());
              },
              child: VocabularyLevel(
                index: (index + 1),
                isSelected: _selectedIndex == index,
              ),
            )
        ],
      ),
    );
  }
}
