class Date {
  String? type;
  String? date;

  Date({this.type, this.date});

  factory Date.formJson(Map<dynamic, dynamic> data) {
    return Date(type: data["type"], date: data["price"]);
  }
}