class Comic {
  int? id;
  String? title;
  int? issueNumber;
  String? imageUrl;
  List<dynamic>? dates;

  // int? total;

  Comic({this.id, this.title, this.issueNumber, this.imageUrl, this.dates});

  factory Comic.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Comic(
        id: parsedJson["id"] as int?,
        title: parsedJson["title"] as String?,
        issueNumber: parsedJson["issueNumber"] as int?,
        imageUrl: parsedJson["thumbnail"]["path"] +
            "." +
            parsedJson["thumbnail"]["extension"] as String?,
      dates: parsedJson["dates"]
        );
  }
}

