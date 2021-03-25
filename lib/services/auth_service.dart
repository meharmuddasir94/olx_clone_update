import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

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

  Future<User?> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("users")
        .doc(user.user!.uid)
        .set({'name': name, 'email': email, 'uid': user.user!.uid});

    return user.user;
  }

  /* Future<User?> signinGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignIn != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User user = authResult.user!;
        var userData = {
          "name": googleSignInAccount.displayName,
          'provider': 'google',
          'photoUrl': googleSignInAccount.photoUrl,
          'email': googleSignInAccount.email,
        };
        users.doc(user.uid).get().then((doc) => {
              if (doc.exists)
                {doc.reference.update(userData)}
              else
                {users.doc(user.uid).set(userData)}
            });
      }
    } catch (PlatformException) {
      print(PlatformException);
      print("SignIn Not Success");
    }
  }*/
}
