import 'package:hive/hive.dart';

class AutocompleteService {
  final Box _box;

  AutocompleteService() : _box = Hive.box('autocompleteCache');

  List<String> getSuggestions(String category, String query) {
    final List<String> history = _box.get(category, defaultValue: <String>[]);
    if (query.isEmpty) return history;
    
    return history
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> addSuggestion(String category, String value) async {
    if (value.trim().isEmpty) return;
    
    final List<String> history = _box.get(category, defaultValue: <String>[]);
    if (!history.contains(value)) {
      history.add(value);
      await _box.put(category, history);
    }
  }
}
