import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class TtsProvider with ChangeNotifier {
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  TtsState ttsState = TtsState.stopped;
  bool isSlow = false;
  bool hidePronunciation1 = true;
  bool hidePronunciation2 = true;
  bool hideTranslation1 = true;
  bool hideTranslation2 = true;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  Future<void> init() async {
    flutterTts = FlutterTts();
    _setAwaitOptions();
    if (isAndroid) {
      _getDefaultEngine();
    }
    flutterTts.setStartHandler(() {
      ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
      ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
      ttsState = TtsState.stopped;
    });

    if (isIOS) {
      flutterTts.setPauseHandler(() {
        ttsState = TtsState.paused;
      });

      flutterTts.setContinueHandler(() {
        ttsState = TtsState.continued;
      });
    }
    flutterTts.setLanguage('zh');

    flutterTts.setErrorHandler((msg) {
      print("Tts error: $msg");
      ttsState = TtsState.stopped;
    });

    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future speak(String? text) async {
    await init();
    if (text != null && text != "") {
      if (isSlow)
        flutterTts.setSpeechRate(0.2);
      else
        flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);
    }
  }

  void switchSpeed() {
    isSlow = !isSlow;
    notifyListeners();
  }

  void switchTranslation(int order) {
    if (order == 1) {
      hideTranslation1 = !hideTranslation1;
    } else {
      hideTranslation2 = !hideTranslation2;
    }
    notifyListeners();
  }

  void switchPronunciation(int order) {
    if (order == 1) {
      hidePronunciation1 = !hidePronunciation1;
    } else {
      hidePronunciation2 = !hidePronunciation2;
    }
    notifyListeners();
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _getDefaultEngine() async {
    engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  void dispose() {
    super.dispose();
    flutterTts.stop();
  }
}
