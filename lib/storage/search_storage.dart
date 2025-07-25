import 'package:hive/hive.dart';
import 'package:movie/models/hive_search.dart';

class SearchStorage {
  static Future<void> saveSearchList(List<Search> searchList) async {
    final box = Hive.box<List>('last_search_box');
    await box.put('search_data', searchList);
  }

  static List<Search>? getLastSearchList() {
    final box = Hive.box<List>('last_search_box');
    final list = box.get('search_data');
    return list?.cast<Search>(); // Ensure correct type
  }
}
