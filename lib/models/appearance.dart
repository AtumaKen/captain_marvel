import 'dates.dart';

class Appearance {
  int? id;
  String? title;
  int? issueNumber;
  String? imageUrl;
  List<dynamic>? dates;

  Appearance({this.id, this.title, this.issueNumber, this.imageUrl, this.dates});

  factory Appearance.fromJson(Map<dynamic, dynamic> json){
    return Appearance(
      id: json['id'],
      title: json['title'],
      issueNumber: json["issueNumber"],
      imageUrl:
      json["thumbnail"]["path"] +
          "." +
          json["thumbnail"]["extension"] as String?,
      dates: json["dates"]
    );
  }
}