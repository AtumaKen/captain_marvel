import 'package:captain_marvel/models/appearance.dart';
import 'package:captain_marvel/service/api_service.dart';
import 'package:intl/intl.dart';

class Utilities{

  static String dateToString(String date){
    return DateFormat.yMd().format(DateTime.parse(date));
  }

  static List<Appearance> filterCaptainMarvel(List<dynamic> publishedComics) {
    List<Appearance> appearances = [];
    publishedComics.forEach((element) {
      List<dynamic> items = element["characters"]["items"];
      items.forEach((characters) {
        if ((characters["name"] as String).contains("Captain Marvel")) {
          appearances.add(Appearance.fromJson(element));
        }
      });
    });
    return appearances;
  }

}