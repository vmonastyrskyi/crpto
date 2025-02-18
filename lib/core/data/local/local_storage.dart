import 'package:shared_preferences/shared_preferences.dart';

final LocalStorage localStorage = LocalStorage.instance;

final class LocalStorage {
  LocalStorage._();

  static LocalStorage? _instance;

  static LocalStorage get instance => _instance ??= LocalStorage._();

  late final SharedPreferencesAsync _sharedPreferencesAsync;

  Future<void> init() async {
    _sharedPreferencesAsync = SharedPreferencesAsync();
  }

  Future<void> put(String key, Object? value) async {
    switch (value) {
      case bool value:
        await _sharedPreferencesAsync.setBool(key, value);
      case int value:
        await _sharedPreferencesAsync.setInt(key, value);
      case double value:
        await _sharedPreferencesAsync.setDouble(key, value);
      case String value:
        await _sharedPreferencesAsync.setString(key, value);
      case List<String> value:
        await _sharedPreferencesAsync.setStringList(key, value);
      default:
        throw UnimplementedError();
    }
  }

  Future<T?> get<T extends Object?>(String key) async {
    switch (T) {
      case const (bool):
        return (await _sharedPreferencesAsync.getBool(key)) as T?;
      case const (int):
        return (await _sharedPreferencesAsync.getInt(key)) as T?;
      case const (double):
        return (await _sharedPreferencesAsync.getDouble(key)) as T?;
      case const (String):
        return (await _sharedPreferencesAsync.getString(key)) as T?;
      case const (List<String>):
        return (await _sharedPreferencesAsync.getStringList(key)) as T?;
      default:
        throw UnimplementedError();
    }
  }

  Future<void> delete(String key) async =>
      await _sharedPreferencesAsync.remove(key);

  Future<void> clear() async => await _sharedPreferencesAsync.clear();
}
