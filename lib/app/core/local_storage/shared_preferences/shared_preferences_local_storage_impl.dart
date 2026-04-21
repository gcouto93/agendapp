import 'package:agenda_ja_app/app/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sharedPreferences = await _instance;
    await sharedPreferences.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<V?> read<V>(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.get(key) as V?;
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instance;
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> write<V>(String key, V value) async {
    final sharedPreferences = await _instance;
    switch (V) {
      case String:
        await sharedPreferences.setString(key, value as String);
        break;
      case int:
        await sharedPreferences.setInt(key, value as int);
        break;
      case double:
        await sharedPreferences.setDouble(key, value as double);
        break;
      case bool:
        await sharedPreferences.setBool(key, value as bool);
        break;
      case const (List<String>):
        await sharedPreferences.setStringList(key, value as List<String>);
        break;
      default:
        throw Exception('Type $V is not supported for SharedPreferences storage');
    }
  }
}
