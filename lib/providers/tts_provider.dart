import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class TtsProvider with ChangeNotifier {
  FlutterTts flutterTts;
  String language;
  String engine;
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  void init() async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("zh-CN");
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    _setAwaitOptions();
    if (isAndroid) {
      _getDefaultEngine();
    }
  }

  Future speak(String text) async {
    if (flutterTts == null) await init();

    if (text != null && text != "") {
      await flutterTts.speak(text);
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  void dispose() {
    super.dispose();
    flutterTts.stop();
  }
}
