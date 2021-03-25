import 'package:flutter/material.dart';

import '../../configuration.dart';

class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: primaryGreen,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              buildChatRow(context),
              buildChatRow(context),
              buildChatRow(context),
              buildChatRow(context),
              buildChatRow(context),
              buildChatRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Container buildChatRow(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10, left: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(top: 10, left: 15),
                child: ClipOval(
                  child: Image.asset(
                    'images/secondbackground.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Andrea",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Andrea There is one thing",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 }
