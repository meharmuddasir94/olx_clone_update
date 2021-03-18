import 'package:flutter/material.dart';

class accountLogedin extends StatefulWidget {
  @override
  _accountLogedinState createState() => _accountLogedinState();
}

class _accountLogedinState extends State<accountLogedin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(top: 20, left: 15),
                    child: CircleAvatar(
                      child: Image.asset("images/parrot.png"),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Name",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "View & Edit Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
