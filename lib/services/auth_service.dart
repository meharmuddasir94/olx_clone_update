
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 

  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(String name, String email, String password,String gender) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  
    await _firestore
        .collection("users")
        .doc(user.user!.uid)
        .set({'name': name, 'email': email,'gender':gender ,'uid': user.user!.uid});

    return user.user;
  }

   
}
