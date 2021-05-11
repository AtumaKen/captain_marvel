import 'package:captain_marvel/models/appearance.dart';
import 'package:captain_marvel/providers/comic_provider.dart';
import 'package:captain_marvel/service/api_service.dart';
import 'package:flutter/cupertino.dart';

class AppearanceProvider with ChangeNotifier {
  late ApiService _apiService;
  late List<Appearance> _appearances;
  static int _offset = 0;
  LoadingStatus _loadingStatus = LoadingStatus.DONE;
  static int _totalItems = 0;

  getLoadingStatus() => _loadingStatus;

  List<Appearance> get appearances => _appearances;

  void initStreams() {
    _apiService = ApiService();
    _appearances = [];
  }

  fetchData() async {
    try {
      List<Appearance> localAppearances =
      await _apiService.getAppearances(_offset);
      if (localAppearances.isEmpty) {
        setLoadingStatus(LoadingStatus.LOADING);
        while (localAppearances.length <= 8) {
          _offset += 100;
          localAppearances.addAll(await _apiService.getAppearances(_offset));
        }
        _appearances = localAppearances;
        _totalItems = _appearances.length;
        setLoadingStatus(LoadingStatus.DONE);
      } else if (_totalItems <= ApiService.totalAppearance) {
        setLoadingStatus(LoadingStatus.LOADING);
        localAppearances.addAll(await addTwelve(_appearances, _offset));
        _appearances.addAll(localAppearances);
        setLoadingStatus(LoadingStatus.DONE);
      } else {
        setLoadingStatus(LoadingStatus.END);
      }
    } catch (e) {
      setLoadingStatus(LoadingStatus.ERROR);
      print(e.toString());
    }
  }

  Future<List<Appearance>> addTwelve(
      List<Appearance> localAppearance, int offset) async {
    int count = 0;
    while (count <= 9) {
      offset += 100;
      localAppearance.addAll(await _apiService.getAppearances(offset));
      count++;
      _offset += 100;
    }
    return localAppearance;
  }

  setLoadingStatus(LoadingStatus loadingStatus) {
    _loadingStatus = loadingStatus;
    notifyListeners();
  }
}
