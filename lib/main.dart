import 'package:diyi/providers/grammar_provider.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:diyi/providers/vocabulary_provider.dart';
import 'package:diyi/screens/home_screen/home_screen.dart';
import 'package:diyi/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diyi/app_router.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<UserProvider>(
          create: (_) => UserProvider(FirebaseAuth.instance),
        ),
        StreamProvider(create: (context) => context.read<UserProvider>().authState, initialData: null),
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
      // initialRoute: isAuth(context) ? ('/home') : ('/login'),
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
