import 'package:day_21_state_management/data/model/province_response.dart';
import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:flutter/material.dart';

class ProvinceProvider extends ChangeNotifier {
  List<ProvinceResponse> _provinces = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ProvinceResponse> get provinces => _provinces;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProvinces() async {
    _isLoading = true;
    notifyListeners();
    try {
      final repository = DataRepository();

      final response = await repository.fetchProvinces();

      _provinces = response;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
