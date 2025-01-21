import 'package:diyi/screens/admin_screen/admin_edit_screen.dart';
import 'package:diyi/screens/admin_screen/admin_home_screen.dart';
import 'package:diyi/screens/admin_screen/admin_user_screen.dart';
import 'package:diyi/screens/login_screen/login_screen.dart';
import 'package:diyi/screens/main_screen.dart';
import 'package:diyi/screens/payment__choice_screen.dart';
import 'package:diyi/screens/payment_screen.dart';
import 'package:diyi/screens/policy_screen.dart';
import 'package:diyi/screens/practice_screens/grammar_practice_result_screen.dart';
import 'package:diyi/screens/practice_screens/grammar_practice_screen.dart';
import 'package:diyi/screens/practice_screens/vocabulary_group_practice_screen.dart';
import 'package:diyi/screens/practice_screens/vocabulary_practice_result_screen.dart';
import 'package:diyi/screens/speaking_screens/speaking_home_screen.dart';
import 'package:diyi/screens/studyChina_screens/study_china_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/screens/grammar_screens/grammar_detail_screen.dart';
import 'package:diyi/screens/grammar_screens/grammar_home_screen.dart';
import 'package:diyi/screens/grammar_screens/grammar_list_screen.dart';
import 'package:diyi/screens/practice_screens/vocabulary_practice_screen.dart';
import 'package:diyi/screens/studyChina_screens/study_china_home_screen.dart';
import 'package:diyi/screens/vocabulary_screens/vocabulary_detail_screen.dart';
import 'package:diyi/screens/vocabulary_screens/vocabulary_home_screen.dart';
import 'package:diyi/screens/vocabulary_screens/vocabulary_list_screen.dart';

class AppRouter {
  Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen(args: settings.arguments));
      case '/vocabulary_home_screen':
        return MaterialPageRoute(builder: (_) => VocabularyHomeScreen());
      case '/vocabulary_list_screen':
        return MaterialPageRoute(builder: (_) => VocabularyListScreen(args: settings.arguments));
      case '/vocabulary_detail_screen':
        return MaterialPageRoute(builder: (_) => VocabularyDetailScreen(args: settings.arguments));
      case '/grammar_home_screen':
        return MaterialPageRoute(builder: (_) => GrammarHomeScreen());
      case '/grammar_list_screen':
        return MaterialPageRoute(builder: (_) => GrammarListScreen(args: settings.arguments));
      case '/grammar_detail_screen':
        return MaterialPageRoute(builder: (_) => GrammarDetailScreen(args: settings.arguments));
      case '/speaking_home_screen':
        return MaterialPageRoute(builder: (_) => SpeakingHomeScreen());
      case '/studyChina_home_screen':
        return MaterialPageRoute(builder: (_) => StudyChinaHomeScreen());
      case '/studyChina_detail_screen':
        return MaterialPageRoute(builder: (_) => StudyChinaDetailScreen(args: settings.arguments));
      case '/practice_screens':
        return MaterialPageRoute(builder: (_) => VocabularyPracticeScreen(args: settings.arguments));
      case '/grammar_practice_screens':
        return MaterialPageRoute(builder: (_) => GrammarPracticeScreen(args: settings.arguments));
      case '/practice_result_screens':
        return MaterialPageRoute(builder: (_) => VocabularyPracticeResultScreen());
      case '/vocabulary_group_practice_screens':
        return MaterialPageRoute(builder: (_) => VocabularyGroupPracticeScreen(args: settings.arguments));
      case '/grammar_practice_result_screens':
        return MaterialPageRoute(builder: (_) => GrammarPracticeResultScreen());
      case '/payment_choice_screen':
        return MaterialPageRoute(builder: (_) => PaymentChoiceScreen());
      case '/payment_screen':
        return MaterialPageRoute(builder: (_) => PaymentScreen(args: settings.arguments));
      case '/admin_home_screen':
        return MaterialPageRoute(builder: (_) => AdminHomeScreen());
      case '/policy_screen':
        return MaterialPageRoute(builder: (_) => PolicyScreen());
      case '/admin_user_screen':
        return MaterialPageRoute(builder: (_) => AdminUserScreen());
      case '/admin_edit_screen':
        return MaterialPageRoute(builder: (_) => AdminEditScreen(args: settings.arguments));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: myAppBar(title: "Route error"),
                  body: Center(child: Text('No route defined')),
                ));
    }
  }
}
