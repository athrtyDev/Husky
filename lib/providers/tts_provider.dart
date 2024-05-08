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
      _getDefaultVoice();
    }
    flutterTts.setStartHandler(() {
      print("Playing");
      ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
      print("Complete");
      ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
      print("Cancel");
      ttsState = TtsState.stopped;
    });

    flutterTts.setPauseHandler(() {
      print("Paused");
      ttsState = TtsState.paused;
    });

    flutterTts.setContinueHandler(() {
      print("Continued");
      ttsState = TtsState.continued;
    });

    flutterTts.setLanguage('zh-CN');

    flutterTts.setErrorHandler((msg) {
      print("Tts error: $msg");
      ttsState = TtsState.stopped;
    });

    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    // var langs = await _getLanguages();
    // print("langsss: ${langs.length} $langs");
  }

  Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future speak(String? text) async {
    await init();
    if (text != null && text != "") {
      if (isSlow)
        await flutterTts.setSpeechRate(0.2);
      else
        await flutterTts.setSpeechRate(0.5);
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
      print("engine: $engine");
    }
  }

  Future<void> _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  void dispose() {
    super.dispose();
    flutterTts.stop();
  }
}
