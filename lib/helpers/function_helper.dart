class FunctionHelper {
  String getMonthAbbreviation(int month) {
    switch (month) {
      case DateTime.january:
        return 'JAN';
      case DateTime.february:
        return 'FEB';
      case DateTime.march:
        return 'MAR';
      case DateTime.april:
        return 'APR';
      case DateTime.may:
        return 'MAY';
      case DateTime.june:
        return 'JUN';
      case DateTime.july:
        return 'JUL';
      case DateTime.august:
        return 'AUG';
      case DateTime.september:
        return 'SEP';
      case DateTime.october:
        return 'OCT';
      case DateTime.november:
        return 'NOV';
      case DateTime.december:
        return 'DEC';
      default:
        return '';
    }
  }

  String getDayAbbreviation(int day) {
    switch (day) {
      case DateTime.monday:
        return 'MON';
      case DateTime.tuesday:
        return 'TUE';
      case DateTime.wednesday:
        return 'WED';
      case DateTime.thursday:
        return 'THU';
      case DateTime.friday:
        return 'FRI';
      case DateTime.saturday:
        return 'SAT';
      case DateTime.sunday:
        return 'SUN';
      default:
        return '';
    }
  }
}
