import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olx_clone/StoreHome/storeHomepage.dart';
import 'package:olx_clone/authentication/loginScreen.dart';
import 'package:olx_clone/configuration.dart';
import 'package:olx_clone/customIcon/custom_icon_icons.dart';

// ignore: camel_case_types
class loginOptions extends StatefulWidget {
  @override
  _loginOptionsState createState() => _loginOptionsState();
}

// ignore: camel_case_types
class _loginOptionsState extends State<loginOptions> {
  Color background = Color(0xff003034);
  Color newcolor = Color(0xff61e5d2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.grey,
            size: 25,
          ),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (_) => storeHomepage());
            Navigator.pushReplacement(context, route);
          },
          iconSize: 25,
        ),
      ),
      //backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 200,
              width: 210,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                "images/secondbackground.png",
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: 80),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  primaryGreen,
                  Colors.greenAccent,
                ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 40,
                    width: 330,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    )),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_iphone_outlined,
                              size: 25,
                              color: background,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Continue with Phone",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSansCondensed(
                                  textStyle: TextStyle(
                                      color: background, fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 40,
                    width: 330,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        child: Row(
                          children: [
                            Icon(
                              CustomIcon.google,
                              size: 25,
                              color: background,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Continue with Google",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSansCondensed(
                                  textStyle: TextStyle(
                                      color: background, fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        child: Row(
                          children: [
                            Icon(
                              CustomIcon.facebook_f,
                              size: 25,
                              color: background,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Continue with Facebook",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSansCondensed(
                                  textStyle: TextStyle(
                                      color: background, fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 40,
                    width: 330,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          // dispose();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginScreen(),
                            ),
                          );

                          //        MaterialPageRoute(builder: (_) => loginScreen());
                          //  Navigator.push(context, route);
                        },
                        child: Row(
                          children: [
                            Icon(
                              CustomIcon.mail_alt,
                              size: 25,
                              color: background,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Continue with Email",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSansCondensed(
                                  textStyle: TextStyle(
                                      color: background, fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "If you Continue, You are accepting",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Text(
                      "OLX terms and Conditions and Privacy Policies.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(color: Colors.black, fontSize: 11),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
