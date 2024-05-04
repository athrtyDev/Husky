import 'package:diyi/global/global.dart';
import 'package:diyi/providers/grammar_practice_provider.dart';
import 'package:diyi/providers/grammar_provider.dart';
import 'package:diyi/providers/study_china_provider.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:diyi/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diyi/app_router.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  app = await Globals();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(FirebaseAuth.instance),
        ),
        StreamProvider(create: (context) => context.read<UserProvider>().authState, initialData: null),
        ChangeNotifierProvider<TtsProvider>(
          create: (_) => TtsProvider(),
        ),
        ChangeNotifierProvider<VocabularyPracticeProvider>(
          create: (_) => VocabularyPracticeProvider(),
        ),
        ChangeNotifierProvider<GrammarPracticeProvider>(
          create: (_) => GrammarPracticeProvider(),
        ),
        ChangeNotifierProvider<VocabularyProvider>(
          create: (_) => VocabularyProvider(),
        ),
        ChangeNotifierProvider<GrammarProvider>(
          create: (_) => GrammarProvider(),
        ),
        ChangeNotifierProvider<VocabularyPracticeProvider>(
          create: (_) => VocabularyPracticeProvider(),
        ),
        ChangeNotifierProvider<StudyChinaProvider>(
          create: (_) => StudyChinaProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      bool paymentChanged = await Provider.of<UserProvider>(context, listen: false).checkPaymentWhenAppOpens();
      if (paymentChanged) {
        print("Payment has changed.");
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Husky',
      theme: ThemeData(fontFamily: 'Mulish'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.generatedRoute,
      home: SplashScreen(),
    );
  }
}
