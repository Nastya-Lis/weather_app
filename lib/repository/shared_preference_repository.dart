import 'package:shared_preferences/shared_preferences.dart';

String keyCountryName = "key_country_name";

class SharedPreferenceRepository {
  late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getLocationName() {
    return _sharedPreferences.getString(keyCountryName);
  }

  void setLocationName(String name) {
    _sharedPreferences.setString(keyCountryName, name);
  }
}
