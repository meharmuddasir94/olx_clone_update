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
          ListTile(
            title: Text("My Posts"),
            subtitle: Text("Details about Posted ADs"),
            leading: Icon(
              Icons.description,
              size: 30,
              color: Colors.black,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: null,
          ),
          ListTile(
            title: Text("Settings"),
            subtitle: Text("Privacy & logout"),
            leading: Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: null,
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
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
