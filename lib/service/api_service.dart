import 'dart:convert';

import 'package:captain_marvel/models/comic.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //captain marvel id: 1011097
   String _authority = "gateway.marvel.com";
   String _apiKey = "4d9804cc157036ba6e3983a9c17e8ad1";
   String _hash = "2ad9b5231885ddd6d70bdbfe43eacc3e";


  Future<List<Comic>> getData(int offset) async {
    String path = "/v1/public/characters/1010338/comics";
    Map<String, dynamic> params = {
      "ts": "1",
      "apikey": _apiKey,
      "hash": _hash,
      "limit": "20",
      "offset": offset.toString()
    };
    final uri = Uri.https(_authority, path, params);
    final response = await http.get(uri);
    final data = jsonDecode(response.body) as Map<dynamic, dynamic>;
    List<dynamic> results = data["data"]["results"];
    List<Comic> comics = [];
    results.forEach((element) {
      comics.add(Comic.fromJson(element));
    });
    return comics;
  }
}
