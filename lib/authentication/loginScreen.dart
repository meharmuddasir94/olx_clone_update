import 'dart:ui';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Color background = Color(0xff003034);
  Color textColor = Color(0xffe2bb51);
  Color activeColor = Colors.black;
  Color unactiveColor = Colors.grey;
  bool isSignupScreen = false;
  bool isMale = false;
  bool isRememberMe = false;
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
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/OLXPakistan.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                color: Color(0xff64c4dd).withOpacity(0.4),
              ),
            ),
          ),
          // buildButtonWithContainer(true),
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            top: 160,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.all(20),
              height: isSignupScreen ? 390 : 270,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
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
            top: MediaQuery.of(context).size.height - 70,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text("Or SignUp with"),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      socialButton(
                        CommunityMaterialIcons.facebook,
                        "Facebook",
                        Color(0xff075691),
                      ),
                      socialButton(CommunityMaterialIcons.google_plus, "Google",
                          Colors.redAccent),
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
          buildTextField(Icons.email_outlined, "Enter Email...", false, true,TextInputAction.next),
          buildTextField(Icons.lock_outlined, "Enter Password", true, false,TextInputAction.go),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: isRememberMe,
                      activeColor: unactiveColor,
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
                  onPressed: null,
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
      top: isSignupScreen ? 520 : 400,
      right: 0,
      left: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            print("clicked");
          },
          child: Container(
            height: 70,
            width: 70,
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

  Container SignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(
              Icons.account_box_outlined, "Enter UserName", false, false,TextInputAction.next),
          buildTextField(Icons.email_outlined, "Enter Email..", false, true,TextInputAction.next),
          buildTextField(Icons.lock_outline, "Enter Password", true, false,TextInputAction.go),
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

  Widget buildTextField(
      IconData icon, String hinnt, bool ispasword, bool isEmail, TextInputAction action) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: TextField(
        obscureText: ispasword,
        textInputAction: action,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
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
    );
  }
}
