import 'package:flutter/material.dart';

class favoriteTab extends StatefulWidget {
  @override
  _favoriteTabState createState() => _favoriteTabState();
}

class _favoriteTabState extends State<favoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          favoriteRow(),
          favoriteRow(),
          favoriteRow(),
          favoriteRow(),
          favoriteRow(),
        ],
      )),
    );
  }

  Container favoriteRow() {
    return Container(
      margin: EdgeInsets.only(top: 2),
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
                    margin: EdgeInsets.only(left: 8, top: 5),
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
                //  mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }
}
