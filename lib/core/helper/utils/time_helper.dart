import 'package:intl/intl.dart';

class TimeUtil {
  static String localTime(String? date) {
    try {
      if (date!.isEmpty) return '';
      var dateValue = DateFormat("yyyy-MM-dd").parseUTC(date).toLocal();
      String formattedDate = DateFormat("hh:mm").format(dateValue);
      return formattedDate;
    } catch (_) {
      return '';
    }
  }

  static String formatDate(String? date) {
    try {
      if (date!.isEmpty) return '';
      DateTime _dt = DateTime.parse(date);
      String _formatDate = DateFormat("MMM dd, yyyy").format(_dt);
      String _formatTime = DateFormat("HH:MM a").format(_dt);

      return '$_formatDate at $_formatTime';
    } catch (_) {
      return '';
    }
  }

  static String formatDate2(String? date) {
    try {
      if (date!.isEmpty) return '';
      DateTime _dt = DateTime.parse(date);
      String _formatDate = DateFormat("dd/MM/yyyy").format(_dt);
      String _formatTime = DateFormat("HH:MM").format(_dt);

      return '$_formatTime, $_formatDate';
    } catch (_) {
      return '';
    }
  }

  static String chatTime(String? date) {
    try {
      if (date!.isEmpty) return '';
      var dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(date, true);
      return DateFormat("hh:mm a").format(dateTime.toLocal());
    } catch (_) {
      return '';
    }
  }

  static String chatTime2(String? date) {
    try {
      if (date!.isEmpty) return '';
      var _dt = DateFormat("yyyy-MM-dd HH:mm").parse(date, true);
      return DateFormat("dd-MM-yyyy hh:mm:ss").format(_dt.toLocal());
    } catch (_) {
      return '';
    }
  }

  static String chatDate(String? date) {
    if (date!.isEmpty) return '';
    try {
      var _dt = DateFormat("yyyy-MM-dd HH:mm").parse(date, true);
      return DateFormat("dd-MM-yyyy").format(_dt.toLocal());
    } catch (_) {
      return '';
    }
  }

  static String chatDateAndTime(String? date) {
    try {
      if (date!.isEmpty) return '';
      var _dt = DateFormat("yyyy-MM-dd HH:mm").parse(date, true);
      return DateFormat("dd-MM-yyyy HH:mm").format(_dt.toLocal());
    } catch (e) {
      return '';
    }
  }

  static String lastTimeMessage(String? dateString) {
    if (dateString == null) return '';
    var _dt = DateFormat("yyyy-MM-dd HH:mm").parse(dateString, true);
    final _formattedTime = DateFormat("HH:mm a").format(_dt.toLocal());
    final _presentDate = DateTime.now();
    final _difference = _presentDate.difference(_dt.toLocal());

    var _formatDateDT = DateFormat("yyyy-MM-dd").parse(dateString, true);

    final _yearDateList = _formatDateDT.toLocal().toString().split(' ');
    final _yearDate = _yearDateList[0];

    final _splttedYear = _yearDate.split('-');
    int _year = int.parse(_splttedYear[0]);
    int _month = int.parse(_splttedYear[2]);
    int _day = int.parse(_splttedYear[1]);

    if (_difference.inDays > 1) {
      return '$_day/$_month/$_year';
    }

    if (_difference.inDays == 0) {
      return _formattedTime;
    }

    if (_difference.inDays == 1) {
      return 'Yesterday';
    }
    return '';
  }

  static String timeAgoSinceDate(String dateString,
      {String? time, bool onlyTime = false}) {
    try {
      List<String> _dateList = dateString.split('-');
      int _day = int.parse(_dateList[0]);
      int _year = int.parse(_dateList[2]);
      int _month = int.parse(_dateList[1]);

      final _temp = DateTime(_year, _month, _day);
      final _presentDate = DateTime.now();

      final _difference = _presentDate.difference(_temp);

      if (_difference.inDays > 1) {
        return '$_day ${_getMonth(_month)} $_year';
      }

      if (_difference.inDays == 0) {
        if (onlyTime) {
          return time ?? '';
        }

        return 'Today';
      }

      if (_difference.inDays == 1) {
        return 'Yesterday';
      }

      return '';
    } catch (_) {
      return '';
    }
  }

  static String getMonthAndYear(String d) {
    List<String> _year = d.split('-');
    int _mYear = int.parse(_year[0]);
    int _mMonth = int.parse(_year[1]);
    // int _mDate = int.parse(_year[2]);
    return '${_getMonth(_mMonth).substring(0, 3)} $_mYear ';
  }

  static String _getMonth(int month) {
    switch (month) {
      case 01:
        return 'January';
      case 02:
        return 'February';
      case 03:
        return 'March';
      case 04:
        return 'April';
      case 05:
        return 'May';
      case 06:
        return 'June';
      case 07:
        return 'July';
      case 08:
        return 'August';
      case 09:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
    }
    return '';
  }
}
