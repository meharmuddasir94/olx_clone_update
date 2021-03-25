import 'package:flutter/material.dart';
import 'package:olx_clone/configuration.dart';

class accountwithoutLogedin extends StatefulWidget {
  @override
  _accountwithoutLogedinState createState() => _accountwithoutLogedinState();
}

class _accountwithoutLogedinState extends State<accountwithoutLogedin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black),
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
                      child: Image.asset(
                        "images/secondbackground.jpg",
                        fit: BoxFit.fill,
                        height: 70,
                        width: 70,
                      ),
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
                  InkWell(
                    onTap: null,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "View & Edit Profile",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text("Help & Support"),
            subtitle: Text("Help center & legal terms"),
            leading: Icon(
              Icons.help,
              size: 30,
              color: Colors.black,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: null,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10, left: 14, right: 14),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: FlatButton(
              child: Text(
                "Login or Register",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              onPressed: null,
              hoverColor: Colors.grey,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
