import 'package:intl/intl.dart';

class Utilities{

  static String dateToString(String date){
    return DateFormat.yMd().format(DateTime.parse(date));
  }
}