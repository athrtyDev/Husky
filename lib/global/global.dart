export 'style.dart';

Globals app = Globals();

class Globals {
  static Globals _instance = Globals();

  factory Globals() {
    _instance = Globals._internal();
    return _instance;
  }

  Globals._internal() {
    _init();
  }

  void _init() async {
    user = "";
  }

  String user;
}
