import 'package:flutter/material.dart';
import 'package:husky/screens/grammar_home_screen/components/grammar_sub_level.dart';

class GrammarSubLevels extends StatefulWidget {
  const GrammarSubLevels({Key key}) : super(key: key);

  @override
  _GrammarSubLevelsState createState() => _GrammarSubLevelsState();
}

class _GrammarSubLevelsState extends State<GrammarSubLevels> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int index = 0; index < 10; index++)
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: GrammarSubLevel(
                  index: index + 1,
                  isSelected: _selectedIndex == index,
                ),
              )
          ],
        ),
      ),
    );
  }
}
