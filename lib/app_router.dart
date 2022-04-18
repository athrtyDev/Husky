import 'package:flutter/material.dart';
import 'package:husky/components/my_app_bar.dart';
import 'package:husky/screens/grammar_home_screen/grammar_home_screen.dart';
import 'package:husky/screens/mockTest_home_screen/mockTest_home_screen.dart';
import 'package:husky/screens/practice_screen/practice_screen.dart';
import 'package:husky/screens/studyChina_home_screen/study_china_home_screen.dart';
import 'package:husky/screens/vocabulary_home_screen/vocabulary_home_screen.dart';
import 'screens/home_screen/home_screen.dart';

class AppRouter {
  Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/vocabulary_home_screen':
        return MaterialPageRoute(builder: (_) => VocabularyHomeScreen());
      case '/grammar_home_screen':
        return MaterialPageRoute(builder: (_) => GrammarHomeScreen());
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
