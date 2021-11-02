import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create myuser object
  MyUser? _userFromFirebase(User? result) {
    return result != null ? MyUser(uid: result.uid) : null;
  }

//auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      MyUser? userDetails = _userFromFirebase(result.user);
      return userDetails;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
