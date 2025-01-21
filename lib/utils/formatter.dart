class Formatter {
  // 2 sar odoriig 2 orontoi bolgoj butsaana. Jishee ni 02
  static formatDayMonth(int value) {
    return value >= 10 ? value.toString() : "0$value";
  }

  static String capitalizeFirstLetter(String str) {
    if (str == "") return "";
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }

  static String moneyFormatter(amount) {
    List<String> amountList = amount.toString().split('.');
    String money = '';
    var x = amountList[0];
    int count = 0;
    int len = x.length;
    for (int i = 1; i < (x.length / 3); i++) {
      money = ',' + x.substring(len - 3, len) + money;
      count = count + 3;
      len -= 3;
    }
    money = x.substring(0, (x.length - count)) + money;
    return "$money₮";
  }
}
