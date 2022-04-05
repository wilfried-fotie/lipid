import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleApi = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleApi.signIn();
}
