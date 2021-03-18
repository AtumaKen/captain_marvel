import 'package:captain_marvel/models/appearance.dart';
import 'package:captain_marvel/service/api_service.dart';
import 'package:flutter/cupertino.dart';

class AppearanceProvider with ChangeNotifier{
  late ApiService _apiService;
  late List<Appearance> _appearances;
  int _totalPages = 0;

  List<Appearance> get appearances => _appearances;

  void initStreams() {
    _apiService = ApiService();
    _appearances = [];
  }

  fetchData(int offset) async {
    List<Appearance> localAppearances = await _apiService.getAppearances(offset);
    if (localAppearances.isEmpty) {
      _totalPages = localAppearances.length;
      _appearances = localAppearances;
    } else {
      _appearances.addAll(localAppearances);
    }
    notifyListeners();
  }
}