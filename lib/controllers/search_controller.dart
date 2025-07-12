import 'package:cinemax/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchPageController extends ChangeNotifier {
  final SearchModel _model = SearchModel();
  final TextEditingController textController = TextEditingController();
  
  SearchModel get model => _model;
  
  void onSearchChanged(String value) {
    _model.setSearchText(value);
    notifyListeners();
    
    // اینجا می‌تونید API کال یا جستجو انجام دهید
    _performSearch(value);
  }
  
  void onSearchSubmitted(String value) {
    if (value.isNotEmpty) {
      _model.addToHistory(value);
      notifyListeners();
      
      // انجام جستجوی نهایی
      _performFinalSearch(value);
    }
  }
  
  void onFilterPressed() {
    // اینجا می‌تونید navigation به صفحه فیلتر انجام دهید
  }
  
  void clearSearch() {
    textController.clear();
    _model.clearSearch();
    notifyListeners();
  }
  
  void _performSearch(String query) {
    // شبیه‌سازی جستجو
    _model.setLoading(true);
    notifyListeners();
    
    // شبیه‌سازی تاخیر API
    Future.delayed(Duration(milliseconds: 500), () {
      _model.setLoading(false);
      notifyListeners();
    });
  }
  
  void _performFinalSearch(String query) {
    // اینجا جستجوی نهایی انجام می‌شود
  }
  
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}