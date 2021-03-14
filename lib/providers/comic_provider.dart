import 'file:///C:/Users/ASUS/AndroidStudioProjects/captain_marvel/lib/service/api_service.dart';
import 'package:captain_marvel/models/comic.dart';
import 'package:flutter/cupertino.dart';
enum LoadingStatus{
  DONE, LOADING
}

class ComicProvider with ChangeNotifier {
  late ApiService _apiService;
  // late Comic _comic;
  late List<Comic> _comics;

  // Comic get comic => _comic;
  List<Comic> get comics => _comics;
  int _totalPages = 0;

  ComicProvider() {
    initStreams();
  }

  void initStreams() {
    _apiService = ApiService();
    // _comic = Comic();
    _comics = [];
  }

  fetchData(int offset) async{
    if(_totalPages == 0 || offset<= _totalPages)
    _comics = await _apiService.getData(offset);
    _totalPages = _comics.length;
    notifyListeners();
  }

}
