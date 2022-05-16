import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as user;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  user.User? _userFromFirebaseUser(User? firebaseUser) {
    return firebaseUser != null ? user.User(uid: firebaseUser.uid) : null;
  }

  Stream<user.User?> get fbUser {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email pass

  //register email pass

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
