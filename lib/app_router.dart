import 'package:flutter/material.dart';
import 'screens/home_screen/home_screen.dart';

class AppRouter {
  Route<dynamic> generatedRoute(settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case '/vocabulary_home':
      //   return PageTransition(child: OnboardScreen(), type: PageTransitionType.fade);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
