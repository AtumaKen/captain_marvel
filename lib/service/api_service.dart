import 'dart:convert';

import 'package:captain_marvel/models/comic.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //captain marvel id: 1011097

  Future<List<Comic>> getData(int offset) async {
    String authority = "gateway.marvel.com";
    String path = "/v1/public/characters/1010338/comics";
    Map<String, dynamic> params = {
      "ts": "1",
      "apikey": "4d9804cc157036ba6e3983a9c17e8ad1",
      "hash": "2ad9b5231885ddd6d70bdbfe43eacc3e",
      "limit": "20",
      "offset": offset.toString()
    };
    final uri = Uri.https(authority, path, params);
    final response = await http.get(uri);
    final data = jsonDecode(response.body) as Map<dynamic, dynamic>;
    // print("sending");
    List<dynamic> stuff = data["data"]["results"];
    List<Comic> comics = [];
    stuff.forEach((element) {
      // print(element["image"]);
      comics.add(Comic.fromJson(element));
    });
    // comics.forEach((element) {print(element.imageUrl);});

    return comics;
  }
}
