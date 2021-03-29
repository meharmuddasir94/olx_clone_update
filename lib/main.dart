import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olx_clone/StoreHome/homepages/dashboard.dart';
import 'package:olx_clone/StoreHome/storeHomepage.dart';

import 'package:olx_clone/authentication/loginOptions.dart';
// ignore: unused_import
import 'package:olx_clone/authentication/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olx Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(0, 48, 52, 0),
        primarySwatch: Colors.blue,
      ),
      home: loginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color background = Color(0xff003034);
  void initState() {
    // TODO: implement initState
    super.initState();
    displaySplash();
  }

  displaySplash() async {
    Timer(Duration(seconds: 20), () async {});
    Route route = MaterialPageRoute(builder: (_) => loginOptions());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0x003034),
        ),
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 250,
                width: 300,
                child: Image.asset(
                  "images/olxLogo.jpg",
                ),
              ),
              Text("World's No. 1 \nMarketplace",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alike(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
