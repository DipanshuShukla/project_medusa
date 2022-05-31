import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  late GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;

  Future googleLogin() async {
    try {
      final _googleUser = await _googleSignIn.signIn();
      if (_googleUser == null) return;

      _user = _googleUser;

      final _googleAuth = await _googleUser.authentication;

      final _userDetails = GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken,
        idToken: _googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(_userDetails);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    await _googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
