import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleApi = GoogleSignIn();

  static Future login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    print(googleAuth);

    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<GoogleSignInAccount?> logout() => _googleApi.signOut();

  // static Future login() async => await Future.value("salut");
  // static Future logout() async => await Future.value("something");
}
