import 'package:intl/intl.dart';

class InfininURLHelpers {
  static List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  static String getRestApiURL(String url) {
    final parts = url.toString().split('//');
    return [parts.first, ''].join('//') + parts.last;
  }

  static String getLegacyApiURLWithVersion(String url) {
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    return url + '/api/v1';
  }

  static String dayOfMonth(DateTime _date) {
    var dateData = DateFormat('EEEE').format(_date);
    return dateData.substring(0, 3);
  }

  // static String getAmPm(String displayTime) {
  //   var _formatedTime =
  //       DateFormat.jm().format(DateFormat("hh:mm:ss").parse(displayTime));
  //   var data = _formatedTime.split(':');
  //   var finalDate = '';
  //   finalDate = data[0];
  //   finalDate = finalDate + data[1].replaceAll('00', '');
  //   return finalDate;
  // }

  static String getAmPm(String displayTime) {
    if (displayTime.isEmpty || displayTime.length != 8 || displayTime[2] != ':' || displayTime[5] != ':') {
      // return an error message or throw an exception if the input is invalid
      return "Invalid input: $displayTime";
    }

    var formattedTime = DateFormat.jm().format(DateFormat("hh:mm:ss").parse(displayTime));
    var data = formattedTime.split(':');
    var finalDate = '';
    finalDate = data[0];
    finalDate = finalDate + data[1].replaceAll('00', '');
    return finalDate;
  }

  //static String get
}
