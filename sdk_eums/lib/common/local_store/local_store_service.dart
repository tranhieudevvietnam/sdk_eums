import 'package:shared_preferences/shared_preferences.dart';
import 'local_store.dart';

class LocalStoreService extends LocalStore {
  static const PREF_ACCESS_TOKEN = 'PREF_ACCESS_TOKEN';
  @override
  Future setAccessToken(String sessionId) async {
    (await SharedPreferences.getInstance())
        .setString(PREF_ACCESS_TOKEN, sessionId);
  }

  @override
  Future<String> getAccessToken() async {
    return (await SharedPreferences.getInstance())
            .getString(PREF_ACCESS_TOKEN) ??
        '';
  }

}
