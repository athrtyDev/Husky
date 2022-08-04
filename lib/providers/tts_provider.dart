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
  TtsState ttsState = TtsState.stopped;
  bool isSlow = false;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  void init() async {
    flutterTts = FlutterTts();
    _setAwaitOptions();
    if (isAndroid) {
      _getDefaultEngine();
    }
    flutterTts.setStartHandler(() {
      print("Tts Playing");
      ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
      print("Tts Complete");
      ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
      print("Tts Cancel");
      ttsState = TtsState.stopped;
    });

    if (isIOS) {
      flutterTts.setPauseHandler(() {
        print("Tts Paused");
        ttsState = TtsState.paused;
      });

      flutterTts.setContinueHandler(() {
        print("Tts Continued");
        ttsState = TtsState.continued;
      });
    }

    flutterTts.setErrorHandler((msg) {
      print("Tts error: $msg");
      ttsState = TtsState.stopped;
    });

    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future speak(String text) async {
    if (flutterTts == null) {
      await init();
    }
    if (text != null && text != "") {
      print("speaking: $text");
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
