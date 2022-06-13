import 'package:diyi/providers/grammar_provider.dart';
import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/app_router.dart';
import 'package:diyi/providers/practice_provider.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TtsProvider>(
          create: (_) => TtsProvider(),
        ),
        ChangeNotifierProvider<PracticeProvider>(
          create: (_) => PracticeProvider(),
        ),
        ChangeNotifierProvider<VocabularyProvider>(
          create: (_) => VocabularyProvider(),
        ),
        ChangeNotifierProvider<GrammarProvider>(
          create: (_) => GrammarProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Husky',
      theme: ThemeData(fontFamily: 'Mulish'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.generatedRoute,
      //initialRoute: ('/splash'),
      initialRoute: ('/login'),
    );
  }
}
