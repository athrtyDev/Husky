class Formatter {
  // 2 sar odoriig 2 orontoi bolgoj butsaana. Jishee ni 02
  static formatDayMonth(int value) {
    return value >= 10 ? value.toString() : "0$value";
  }
}
