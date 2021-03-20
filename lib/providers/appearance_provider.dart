import 'package:captain_marvel/models/appearance.dart';
import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/service/api_service.dart';
import 'package:flutter/cupertino.dart';

class AppearanceProvider with ChangeNotifier{
  late ApiService _apiService;
  late List<Appearance> _appearances;
  static int _totalPages = 0;
  LoadingStatus _loadingStatus = LoadingStatus.DONE;

  getMoreData() => _loadingStatus;

  List<Appearance> get appearances => _appearances;

  void initStreams() {
    _apiService = ApiService();
    _appearances = [];
  }

  fetchData() async {
    List<Appearance> localAppearances = await _apiService.getAppearances(_totalPages);
    if (localAppearances.isEmpty) {
      while(localAppearances.length <= 12){
        _totalPages += 100;
        localAppearances.addAll(await _apiService.getAppearances(_totalPages));
      }
      _appearances = localAppearances;
      setLoadingStatus(LoadingStatus.DONE);
      print(localAppearances.length);
    } else {
      localAppearances.addAll(await addTwelve(_appearances, _totalPages));
      _appearances.addAll(localAppearances);
      setLoadingStatus(LoadingStatus.DONE);
    }
    // else {
    //   _appearances.addAll(localAppearances);
    // }
  }

  Future<List<Appearance>> addTwelve(List<Appearance> localAppearance, int offset) async {
    int count = 0;
    print("adding twelve");
    while (count <= 12){
      offset += 100;
      localAppearance.addAll(await _apiService.getAppearances(offset));
      count++;
      print(count);
      _totalPages += 100;
    }
    return localAppearance;
  }

  setLoadingStatus(LoadingStatus loadingStatus){
    _loadingStatus = loadingStatus;
    notifyListeners();
  }
}