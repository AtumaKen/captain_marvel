import 'package:captain_marvel/models/comic.dart';
import 'package:flutter/cupertino.dart';

import '../service/api_service.dart';

enum LoadingStatus { DONE, LOADING, ERROR, END }

class ComicProvider with ChangeNotifier {
  late ApiService _apiService;
  LoadingStatus _loadingStatus = LoadingStatus.DONE;
  late List<Comic> _comics;
  getLoadingStatus() => _loadingStatus;
  List<Comic> get comics => _comics;
  static int _totalPages = 0;

  ComicProvider() {
    initStreams();
  }

  void initStreams() {
    _apiService = ApiService();
    // _comic = Comic();
    _comics = [];
  }

  void fetchData(int offset) async {
    try {
      List<Comic> localComics = await _apiService.getComics(offset);
      if (localComics.isEmpty) {
        _totalPages = _comics.length;
        _comics = localComics;
        setLoadingStatus(LoadingStatus.DONE);
      } else if(_totalPages <= ApiService.totalComics) {
        _loadMore(localComics);
      }
      else setLoadingStatus(LoadingStatus.END);
    } catch(e){
      setLoadingStatus(LoadingStatus.ERROR);
      print(e.toString());
    }
  }

  void _loadMore(List<Comic> localComics) {
    setLoadingStatus(LoadingStatus.LOADING);
    _comics.addAll(localComics);
    _totalPages += comics.length;
    setLoadingStatus(LoadingStatus.DONE);
  }



  void setLoadingStatus(LoadingStatus loadingStatus){
    _loadingStatus = loadingStatus;
    notifyListeners();
  }

}
