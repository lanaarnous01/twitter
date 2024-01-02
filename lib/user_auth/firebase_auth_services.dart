

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:twitter_app/models/user_model.dart';


class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user){
    if(user == null) {
      return null;
    }
    return User(user.email, user.uid);
  }

  Stream<User?>? get user{
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future <User?> signInWithEmailAndPassword(String email, String password)async{
  final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  return _userFromFirebase(credential.user);
  }

  Future <User?> createUserWithEmailAndPassword(String email, String password)async{
final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

return _userFromFirebase(credential.user);
  } 

  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }


}




// class FirebaseAuthServices{
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> signUpWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential credential = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
//     return credential.user;
//     }catch(e){
//       print('there is an error');
//     }
//     return null;
//   }

//   Future<User?> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential credential = await  _auth.signInWithEmailAndPassword(email: email, password: password);
//     return credential.user;
//     }catch(e){
//       print('there is an error');
//     }
//     return null;
//   }


// }