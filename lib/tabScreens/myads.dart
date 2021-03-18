import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class myadsTab extends StatefulWidget {
  @override
  _myadsTabState createState() => _myadsTabState();
}

class _myadsTabState extends State<myadsTab> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPostAds(context, now),
            buildPostAds(context, now),
            buildPostAds(context, now),
            buildPostAds(context, now),
          ],
        ),
      ),
    );
  }

  Container buildPostAds(BuildContext context, DateTime now) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    DateFormat.yMMMd().add_jm().format(now),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  // alignment: Alignment.topRight,
                  //margin: EdgeInsets.only(bottom: 25),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            //  margin: EdgeInsets.only(top: 5),
            height: 160,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black, width: 2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          margin: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/olxLogo.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 30, left: 10),
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 0, left: 10),
                            child: Text(
                              "Link Description here.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 0, left: 10),
                            child: Text(
                              "Link Description here.",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, right: 4),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.favorite,
                        size: 26,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            height: 65,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    //  borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 6,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlatButton(
                    onPressed: null,
                    child: Text(
                      "Edit AD",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    //  borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 6,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlatButton(
                    onPressed: null,
                    child: Text(
                      "Delete AD",
                      style: TextStyle(color: Colors.white, fontSize: 10),
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
