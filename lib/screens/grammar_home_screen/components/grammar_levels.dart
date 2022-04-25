import 'package:flutter/material.dart';
import 'package:diyi/screens/vocabulary_home_screen/components/vocabulary_level.dart';

class GrammarLevels extends StatefulWidget {
  const GrammarLevels({Key key}) : super(key: key);

  @override
  _GrammarLevelsState createState() => _GrammarLevelsState();
}

class _GrammarLevelsState extends State<GrammarLevels> {
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
