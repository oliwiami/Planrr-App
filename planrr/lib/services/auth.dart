import 'package:firebase_auth/firebase_auth.dart';
import 'package:planrr/models/my_user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  MyUser? _userFromDatabase(User? user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream 
  Stream<MyUser?> get user{
    return _auth.authStateChanges().map((User? user) => _userFromDatabase(user));
  }
  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromDatabase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password


  // register with email and password
  Future register(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromDatabase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign out

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
      return null;
    }
  }
}
