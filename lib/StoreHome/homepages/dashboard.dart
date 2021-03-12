import 'package:flutter/material.dart';
import 'package:olx_clone/configuration.dart';
import 'package:olx_clone/postDetails.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  double xoffSet = 0;
  double yoffSet = 0;
  double scaleFactor = 1;
  bool drawerState = false;
  List<Map> categories = [
    {'name': 'Cats', 'iconPath': 'images/cat.png'},
    {'name': 'Dogs', 'iconPath': 'images/dog.png'},
    {'name': 'Bunnies', 'iconPath': 'images/rabbit.png'},
    {'name': 'Parrots', 'iconPath': 'images/parrot.png'},
    {'name': 'Horses', 'iconPath': 'images/horse.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffSet, yoffSet, 0)
        ..scale(scaleFactor),
      duration: Duration(
        milliseconds: 250,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(drawerState ? 30.0 : 0.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  drawerState
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              xoffSet = 0;
                              yoffSet = 0;
                              scaleFactor = 1;
                              drawerState = false;
                            });
                          },
                          icon: Icon(Icons.arrow_back_ios))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              xoffSet = 230;
                              yoffSet = 150;
                              scaleFactor = 0.6;
                              drawerState = true;
                            });
                          },
                          icon: Icon(Icons.menu),
                        ),
                  Column(
                    children: [
                      Text(
                        "Location",
                        textAlign: TextAlign.end,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.lightGreen,
                          ),
                          Text("Lahore"),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search_outlined),
                  Text("Search Pet"),
                  Icon(Icons.settings),
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              categories[index]['iconPath'],
                              height: 50,
                              width: 50,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(categories[index]['name'])
                        ],
                      ),
                    );
                  }),
            ),
            buildListADs(),
            buildListADs(),
            buildListADs(),
          ],
        ),
      ),
    );
  }

  Widget buildListADs() {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (_) => postDetails());
        Navigator.push(context, route);
      },
      child: Container(
        height: 250,
        //width: MediaQuery.of(context).size.width - 200,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadowList,
                    ),
                    margin: EdgeInsets.only(top: 50),
                  ),
                  Align(
                    child: Image.asset('images/pet-cat2.png'),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: shadowList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
