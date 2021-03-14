class Comic {
  int? id;
  String? title;
  int? issueNumber;
  String? imageUrl;
  List<dynamic>? prices;

  // int? total;

  Comic({this.id, this.title, this.issueNumber, this.imageUrl, this.prices});

  factory Comic.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Comic(
        id: parsedJson["id"] as int?,
        title: parsedJson["title"] as String?,
        issueNumber: parsedJson["issueNumber"] as int?,
        imageUrl: parsedJson["thumbnail"]["path"] +
            "." +
            parsedJson["thumbnail"]["extension"] as String?,
        // prices: (parsedJson["prices"] as List).map((e) => Prices.formJson(e)).toList()
        // total: parsedJson["total"] as int?
        );
  }
}

class Prices {
  String? type;
  double? amount;

  Prices({this.type, this.amount});

  factory Prices.formJson(Map<dynamic, dynamic> data) {
    return Prices(type: data["type"], amount: data["price"]);
  }
}
