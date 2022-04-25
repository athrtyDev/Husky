import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/screens/grammar_home_screen/grammar_detail_screen.dart';
import 'package:diyi/screens/grammar_home_screen/grammar_home_screen.dart';
import 'package:diyi/screens/grammar_home_screen/grammar_list_screen.dart';
import 'package:diyi/screens/mockTest_home_screen/mockTest_home_screen.dart';
import 'package:diyi/screens/practice_screen/practice_screen.dart';
import 'package:diyi/screens/studyChina_home_screen/study_china_home_screen.dart';
import 'package:diyi/screens/vocabulary_home_screen/vocabulary_detail_screen.dart';
import 'package:diyi/screens/vocabulary_home_screen/vocabulary_home_screen.dart';
import 'package:diyi/screens/vocabulary_home_screen/vocabulary_list_screen.dart';
import 'screens/home_screen/home_screen.dart';

class AppRouter {
  Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/vocabulary_home_screen':
        return MaterialPageRoute(builder: (_) => VocabularyHomeScreen());
      case '/vocabulary_list_screen':
        return MaterialPageRoute(builder: (_) => VocabularyListScreen(args: settings.arguments));
      case '/vocabulary_detail_screen':
        return MaterialPageRoute(builder: (_) => VocabularyDetailScreen(args: settings.arguments));
      case '/grammar_home_screen':
        return MaterialPageRoute(builder: (_) => GrammarHomeScreen());
      case '/grammar_list_screen':
        return MaterialPageRoute(builder: (_) => GrammarListScreen());
      case '/grammar_detail_screen':
        return MaterialPageRoute(builder: (_) => GrammarDetailScreen());

      case '/mockTest_home_screen':
        return MaterialPageRoute(builder: (_) => MockTestHomeScreen());
      case '/studyChina_home_screen':
        return MaterialPageRoute(builder: (_) => StudyChinaHomeScreen());
      case '/practice_screen':
        return MaterialPageRoute(builder: (_) => PracticeScreen(args: settings.arguments));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: myAppBar(title: "Route error"),
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
