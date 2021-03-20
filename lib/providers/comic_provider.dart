import 'package:captain_marvel/models/comic.dart';
import 'package:flutter/cupertino.dart';

import '../service/api_service.dart';

enum LoadingStatus { DONE, LOADING }

class ComicProvider with ChangeNotifier {
  late ApiService _apiService;

  late List<Comic> _comics;

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

  fetchData(int offset) async {
    List<Comic> localComics = await _apiService.getComics(offset);
    if (localComics.isEmpty) {
      _totalPages = _comics.length;
      _comics = localComics;
    } else {
      _comics.addAll(localComics);
    }
    notifyListeners();
  }
}
