import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olx_clone/authentication/loginScreen.dart';
import 'package:olx_clone/customIcon/custom_icon_icons.dart';

class loginOptions extends StatefulWidget {
  @override
  _loginOptionsState createState() => _loginOptionsState();
}

class _loginOptionsState extends State<loginOptions> {
  Color background = Color(0xff003034);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.cancel_sharp),
          onPressed: null,
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
              child: Image.asset(
                "images/secondbackground.jpg",
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    height: 50,
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
                                      color: background, fontSize: 23),
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
                    height: 50,
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
                                      color: background, fontSize: 23),
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
                    height: 50,
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
                                      color: background, fontSize: 23),
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
                    height: 50,
                    width: 330,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          Route route =
                              MaterialPageRoute(builder: (_) => loginScreen());
                          Navigator.pushReplacement(context, route);
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
                                      color: background, fontSize: 23),
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
                        textStyle: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Text(
                      "OLX terms and Conditions and Privacy Policies.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(color: Colors.black, fontSize: 13),
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
