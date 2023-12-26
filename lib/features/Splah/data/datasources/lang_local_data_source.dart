import '../../../../Core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String?> getSavedLang();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences preferences;

  LocalDataSourceImpl({required this.preferences});
  @override
  Future<bool> changeLang({required String langCode}) async {
    return await preferences.setString(AppStrings.locale, langCode);
  }

  @override
  Future<String?> getSavedLang() async =>
      preferences.containsKey(AppStrings.locale)
          ? preferences.getString(AppStrings.locale)
          : AppStrings.english;
}
