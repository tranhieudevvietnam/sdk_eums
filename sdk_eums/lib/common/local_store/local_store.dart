
abstract class LocalStore {

  Future setAccessToken(String accessToken);

  Future<String> getAccessToken();
}
