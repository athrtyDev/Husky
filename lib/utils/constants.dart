import 'package:diyi/core/classes/Menu.dart';

class MenuType {
  static const vocabulary = "vocabulary";
  static const grammar = "grammar";
  static const test = "mockTest";
  static const studyChina = "studyChina";
  static const videoLesson = "videoLesson";
}

class ListMenu {
  static final List<Menu> listMenu = [
    Menu(
      type: MenuType.vocabulary,
      name: "Үг цээжлэх",
      icon: "assets/images/ic_home_vocabulary.png",
    ),
    Menu(
      type: MenuType.grammar,
      name: "Дүрэм",
      icon: "assets/images/ic_home_grammar.png",
    ),
    Menu(
      type: MenuType.test,
      name: "Тест",
      icon: "assets/images/ic_home_test.png",
    ),
    Menu(
      type: MenuType.studyChina,
      name: "БНХАУ-д сурах",
      icon: "assets/images/ic_home_china.png",
    ),
  ];
}

class _Validations {
  RegExp email = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp name = new RegExp(r'^[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]{2,}$');
  RegExp docNumber = new RegExp(r'^[a-zA-Z0-9]{6,}$');
  RegExp search = new RegExp(r'^[a-z,A-Z]{1,}.*$');
  RegExp phoneNumber = new RegExp(r'^[0-9]{8,}$');

  static _Validations instance = _Validations();
}

_Validations get validation => _Validations.instance;
