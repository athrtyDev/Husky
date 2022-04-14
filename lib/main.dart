import 'package:flutter/material.dart';
import 'package:husky/app_router.dart';
import 'package:husky/providers/tts_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TtsProvider>(
          create: (_) => TtsProvider(),
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
      initialRoute: ('/home'),
    );
  }
}
