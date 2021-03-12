import 'package:flutter/material.dart';
import 'package:olx_clone/configuration.dart';

class postDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueGrey[300],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(onPressed: null, icon: Icon(Icons.share))
                ],
              ),
            ),
          ),
          Container(
            height: 330,
            margin: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset("images/pet-cat2.png"),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: shadowList,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(8),
//width: MediaQuery.of(context).size.width / 8,
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: shadowList,
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  buildcontactButtons(context, "Chat", Icons.message_outlined),
                  buildcontactButtons(
                      context, "Call", Icons.call_made_outlined),
                  buildcontactButtons(context, "Email", Icons.email_outlined),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildcontactButtons(BuildContext context, String Name, IconData icon) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 5,
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                //  margin: EdgeInsets.only(left: 15),
                child: Icon(
              icon,
              size: 22,
            )),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                Name,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ]),
        ),
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadowList,
        ),
      ),
    );
  }
}
