import 'package:card_markethome/index.dart';

class SharedPrefHelper {
  static const String languageKey = "selected_language";
  static const String userKey = "USER_INFORMATION_CACHED";

  /// Lấy ngôn ngữ đã lưu trong SharedPreferences
  static Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(languageKey);
    return Locale(languageCode ?? "en"); // Mặc định là "en"
  }

  /// Đổi ngôn ngữ và lưu vào SharedPreferences
  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, languageCode);
  }

  static Future<void> saveUser(UserInformationModel userInformation) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(userInformation.toJson());
    await prefs.setString(userKey, userJson);
  }

  static Future<UserInformationModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(userKey);
    if (userJson != null) {
      return UserInformationModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  static Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }
}
