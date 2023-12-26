import 'dart:convert';

import '../../../../Core/error/exceptions.dart';
import '../../../../Core/utils/app_strings.dart';
import '../models/qoute_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomeQouteLocalDataSource {
  Future<QouteModels> getLastRandomeQoute();
  Future<void> cacheQoute(QouteModels qouteModels);
}

class RandomeQouteLocalDataSourceImpl implements RandomeQouteLocalDataSource {
  final SharedPreferences preferences;

  RandomeQouteLocalDataSourceImpl({required this.preferences});
  @override
  Future<void> cacheQoute(QouteModels qouteModels) {
    return preferences.setString(
        AppStrings.cachedRandomeQoute, json.encode(qouteModels));
  }

  @override
  Future<QouteModels> getLastRandomeQoute() {
    final jsonString = preferences.getString(AppStrings.cachedRandomeQoute);
    if (jsonString != null) {
      final cachedrandomeQoute =
          Future.value(QouteModels.fromJson(json.decode(jsonString)));
      return cachedrandomeQoute;
    } else {
      throw CacheException();
    }
  }
}
