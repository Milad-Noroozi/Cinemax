class SearchModel {
  String _searchText = '';
  List<String> _searchHistory = [];
  bool _isLoading = false;
  
  String get searchText => _searchText;
  List<String> get searchHistory => _searchHistory;
  bool get isLoading => _isLoading;
  
  void setSearchText(String text) {
    _searchText = text;
  }
  
  void addToHistory(String text) {
    if (text.isNotEmpty && !_searchHistory.contains(text)) {
      _searchHistory.insert(0, text);
      if (_searchHistory.length > 10) {
        _searchHistory.removeLast();
      }
    }
  }
  
  void setLoading(bool loading) {
    _isLoading = loading;
  }
  
  void clearSearch() {
    _searchText = '';
  }
}