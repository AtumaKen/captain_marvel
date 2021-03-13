import 'package:http/http.dart' as http;


class ApiService{
  Future<void> sendData() async {
    Uri uri = Uri(path: "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=4d9804cc157036ba6e3983a9c17e8ad1&hash=2ad9b5231885ddd6d70bdbfe43eacc3e");
   final response = await http.get(uri);
   print("sending");
   print(response.body);
  }
}