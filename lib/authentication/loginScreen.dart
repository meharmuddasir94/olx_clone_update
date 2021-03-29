import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:olx_clone/Model/constantStyles.dart';
import 'package:olx_clone/StoreHome/storeHomepage.dart';
import 'package:olx_clone/configuration.dart';
import 'package:olx_clone/services/auth_service.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen> {
  Color background = Color(0xff003034);
  Color textColor = Color(0xffe2bb51);
  Color activeColor = Colors.black;
  Color unactiveColor = Colors.grey;
  bool isSignupScreen = false;
  bool isMale = false;
  bool isRememberMe = false;
  late User user;
  AuthService _authService = AuthService();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/backgroundLogin.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 15),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Welcome to",
                        style: TextStyle(color: Colors.black, fontSize: 19)),
                    TextSpan(
                      text: " Apppet",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ])),
                ),
              ),
            ),
          ),
          // buildButtonWithContainer(true),
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            top: 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.all(20),
              height: isSignupScreen ? 350 : 250,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: isSignupScreen
                                        ? unactiveColor
                                        : activeColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: textColor,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: isSignupScreen
                                        ? activeColor
                                        : unactiveColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: textColor,
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) SignupSection(),
                    if (!isSignupScreen) buidSigninSection(),
                  ],
                ),
              ),
            ),
          ),
          buildButtonWithContainer(false),
          Positioned(
            top: MediaQuery.of(context).size.height - 65,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text("Or SignUp with"),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          _signinFacebook();
                        },
                        child: socialButton(
                          CommunityMaterialIcons.facebook,
                          "Facebook",
                          Color(0xff075691),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          signinGoogle();
                        },
                        child: socialButton(CommunityMaterialIcons.google_plus,
                            "Google", Colors.redAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buidSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.email, "Enter Email...", false, true,
              TextInputAction.next, emailController),
          buildTextField(Icons.vpn_key, "Enter Password", true, false,
              TextInputAction.go, passwordController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: isRememberMe,
                      activeColor: Colors.greenAccent,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      }),
                  Text(
                    "Remember Me",
                    style: TextStyle(
                      color: activeColor,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {
                    showToast("Option Not available");
                  },
                  child: Text(
                    "Forgot Pasword?",
                    style: TextStyle(
                      fontSize: 12,
                      color: unactiveColor,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  TextButton socialButton(IconData icon, String title, Color background) {
    return TextButton(
      onPressed: null,
      style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.grey),
        minimumSize: Size(140, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // primary: Colors.white,
        backgroundColor: background,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonWithContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(
        milliseconds: 700,
      ),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 553 : 454,
      right: 0,
      left: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            isSignupScreen ? registerUser(context) : signIn(context);
            isSignupScreen ? print("Sign up clicked") : print("Login clicked");

            print("clicked");
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                ]),
            child: !showShadow
                ? Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.red],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ]),
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: activeColor,
                    ),
                  )
                : Center(),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container SignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.account_circle_rounded, "Enter UserName", false,
              false, TextInputAction.next, fullnameController),
          buildTextField(Icons.email, "Enter Email..", false, true,
              TextInputAction.next, emailController),
          buildTextField(Icons.vpn_key, "Enter Password", true, false,
              TextInputAction.go, passwordController),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: isMale ? unactiveColor : textColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: isMale ? unactiveColor : textColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 18,
                          color: activeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 50),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: isMale ? textColor : unactiveColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: isMale ? textColor : unactiveColor,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Female",
                  style: TextStyle(
                    fontSize: 18,
                    color: activeColor,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 5),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our",
                  style: TextStyle(
                    color: unactiveColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Term & Conditions",
                      style: TextStyle(
                        color: textColor,
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(IconData icon, String hinnt, bool ispasword,
      bool isEmail, TextInputAction action, TextEditingController contr) {
    return Container(
      height: 55,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: TextField(
          obscureText: ispasword,
          textInputAction: action,
          controller: contr,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              size: 22,
              color: activeColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: unactiveColor,
              ),
              borderRadius: BorderRadius.circular(35.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: unactiveColor,
              ),
              borderRadius: BorderRadius.circular(35.0),
            ),
            hintText: hinnt,
            hintStyle: TextStyle(fontSize: 14, color: unactiveColor),
          ),
        ),
      ),
    );
  }

  void registerUser(BuildContext context) async {
    String male;
    isMale ? male = "Male" : male = "Female";

    _authService
        .createPerson(
      fullnameController.text,
      emailController.text,
      passwordController.text,
      male,
    )
        .then((value) {
      if (value != null) {
        showToast("Sign up Successfully");
        emailController.clear();
        fullnameController.clear();
        passwordController.clear();

        return Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginScreen()));
      } else {
        showToast("Sign up Failed");
      }
    });
  }

  void signIn(BuildContext context) async {
    _authService
        .signIn(emailController.text, passwordController.text)
        .then((value) {
      if (value != null) {
        showToast("Loged in Successfully");
        emailController.clear();
        fullnameController.clear();
        passwordController.clear();
        return Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => storeHomepage()));
      } else {
        showToast("Not Successful");
      }
    });
  }

  showToast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<User?> signinGoogle() async {
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
                {
                  doc.reference.update(userData),
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => storeHomepage()),
                  ),
                }
              else
                {
                  users.doc(user.uid).set(userData),
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => storeHomepage()),
                  ),
                }
            });
      }
    } catch (PlatformException) {
      print(PlatformException);
      print("SignIn Not Success");
    }
  }

  Future _signinFacebook() async {
    final FacebookLoginResult result = await _facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        await _loginWithfacebook(result);

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future _loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    user = a.user!;
    var userData = {
      "name": user.displayName,
      'provider': 'facebook',
      'photoUrl': user.photoURL,
      'email': user.email,
    };
    users.doc(user.uid).get().then((doc) => {
          if (doc.exists)
            {
              doc.reference.update(userData),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => storeHomepage()),
              ),
            }
          else
            {
              users.doc(user.uid).set(userData),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => storeHomepage()),
              ),
            }
        });
  }

  Future<void> facebookSignout() async {
    await _auth.signOut().then((onValue) {
      setState(() {
        _facebookLogin.logOut();
      });
    });
  }
}
