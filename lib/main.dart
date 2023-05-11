import 'package:diyi/core/api.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/grammar_practice_provider.dart';
import 'package:diyi/providers/grammar_provider.dart';
import 'package:diyi/providers/study_china_provider.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:diyi/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diyi/app_router.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    getAppStaticData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Husky',
      theme: ThemeData(fontFamily: 'Mulish'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.generatedRoute,
      home: MainScreen(),
    );
  }

  Future<void> getAppStaticData() async {
    Api api = Api();
    app.appStaticData = await api.getAppStaticData();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    app.isReviewingVersion = int.parse(packageInfo.buildNumber) > app.appStaticData.static['approved_build_number'];
    print("installed version: ${packageInfo.buildNumber}. isReviewingVersion: ${app.isReviewingVersion}");
  }
}
