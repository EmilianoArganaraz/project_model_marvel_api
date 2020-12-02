import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PreferencesUser{
  @factoryMethod
  static Future<PreferencesUser> init() async{
    final PreferencesUser _preferencesUser = PreferencesUser();
    _preferencesUser.preferences = await SharedPreferences.getInstance();

    return _preferencesUser;
  }

  SharedPreferences preferences;
  bool logged = false;
  String email;
  String password;
}