import 'package:captain_marvel/models/comic.dart';
import 'package:flutter/cupertino.dart';

import '../service/api_service.dart';

enum LoadingStatus { DONE, LOADING, ERROR }

class ComicProvider with ChangeNotifier {
  late ApiService _apiService;
  LoadingStatus _loadingStatus = LoadingStatus.DONE;
  late List<Comic> _comics;
  getLoadingStatus() => _loadingStatus;
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
    try {
      List<Comic> localComics = await _apiService.getComics(offset);
      if (localComics.isEmpty) {
        _totalPages = _comics.length;
        _comics = localComics;
        setLoadingStatus(LoadingStatus.DONE);
      } else {
        _comics.addAll(localComics);
        setLoadingStatus(LoadingStatus.DONE);
      }
    } catch(e){
      setLoadingStatus(LoadingStatus.ERROR);
    }
  }

  setLoadingStatus(LoadingStatus loadingStatus){
    _loadingStatus = loadingStatus;
    notifyListeners();
  }
}
