import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/core/constants.dart';

class AuthenticationService {
  static Future<void> signIn() async {
    UserCredential cred = await FirebaseAuth.instance.signInAnonymously();
    uid = cred.user.uid;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
