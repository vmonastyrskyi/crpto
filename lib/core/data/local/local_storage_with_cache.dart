import 'package:shared_preferences/shared_preferences.dart';

final LocalStorageWithCache localStorageWithCache = LocalStorageWithCache.instance;

final class LocalStorageWithCache {
  LocalStorageWithCache._();

  static LocalStorageWithCache? _instance;

  static LocalStorageWithCache get instance => _instance ??= LocalStorageWithCache._();

  late final SharedPreferencesWithCache _sharedPreferencesWithCache;

  Future<void> init() async {
    _sharedPreferencesWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );

    await _sharedPreferencesWithCache.reloadCache();
  }

  Future<void> put(String key, Object? value) async {
    switch (value) {
      case bool value:
        await _sharedPreferencesWithCache.setBool(key, value);
      case int value:
        await _sharedPreferencesWithCache.setInt(key, value);
      case double value:
        await _sharedPreferencesWithCache.setDouble(key, value);
      case String value:
        await _sharedPreferencesWithCache.setString(key, value);
      case List<String> value:
        await _sharedPreferencesWithCache.setStringList(key, value);
      default:
        throw UnimplementedError();
    }
  }

  T? get<T extends Object?>(String key) {
    switch (T) {
      case const (bool):
        return _sharedPreferencesWithCache.getBool(key) as T?;
      case const (int):
        return _sharedPreferencesWithCache.getInt(key) as T?;
      case const (double):
        return _sharedPreferencesWithCache.getDouble(key) as T?;
      case const (String):
        return _sharedPreferencesWithCache.getString(key) as T?;
      case const (List<String>):
        return _sharedPreferencesWithCache.getStringList(key) as T?;
      default:
        throw UnimplementedError();
    }
  }

  Future<void> delete(String key) async =>
      await _sharedPreferencesWithCache.remove(key);

  Future<void> clear() async => await _sharedPreferencesWithCache.clear();
}
