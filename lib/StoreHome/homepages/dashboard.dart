import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:olx_clone/Model/catergoryModel.dart';
import 'package:olx_clone/Model/constantStyles.dart';
import 'package:olx_clone/Model/pet.dart';
import 'package:olx_clone/configuration.dart';
import 'package:olx_clone/drawer.dart';
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
  bool isFavorite = false;
  bool selectedCatogory = false;

  List<Category> categoryItem = [
    Category(
      image: 'images/cat.png',
      name: 'Cat',
      isSelected: false,
    ),
    Category(
      image: 'images/dog.png',
      name: 'Dog',
      isSelected: false,
    ),
    Category(
      image: 'images/fish.png',
      name: 'Fish',
      isSelected: false,
    ),
    Category(
      image: 'images/rabbit.png',
      name: 'Rabbit',
      isSelected: false,
    ),
    Category(
      image: 'images/parrot.png',
      name: 'PArrot',
      isSelected: false,
    ),
    Category(
      image: 'images/horse.png',
      name: 'Horse',
      isSelected: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      drawerScreen(),
      AnimatedContainer(
        transform: Matrix4.translationValues(xoffSet, yoffSet, 0)
          ..scale(scaleFactor)
          ..rotateY(drawerState ? -0.5 : 0),
        duration: Duration(
          milliseconds: 500,
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
                width: MediaQuery.of(context).size.width,
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
                            icon: Icon(
                              FontAwesomeIcons.alignCenter,
                              color: primaryGreen,
                            ),
                          ),
                    Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Location",
                          //textAlign: TextAlign.end,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.lightGreen,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                //  overflow: TextOverflow.ellipsis,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Lahore, ",
                                    style: TextStyle(
                                        color: primaryGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "PK",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ]),
                              ),
                            ],
                          ),
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
                    Expanded(
                      child: Container(
                        height: 22,
                        margin: EdgeInsets.only(left: 5),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: "Search Pet",
                              hintStyle: TextStyle(fontSize: 13),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Icon(Icons.settings),
                  ],
                ),
              ),
              Container(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryItem.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (categoryItem
                                    .any((item) => item.isSelected)) {
                                  setState(() {
                                    categoryItem[index].isSelected =
                                        !categoryItem[index].isSelected;
                                  });
                                }
                              },
                              onLongPress: () {
                                setState(() {
                                  categoryItem[index].isSelected = true;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    color: categoryItem[index].isSelected
                                        ? primaryGreen
                                        : Colors.white,
                                    boxShadow: shadowList,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  categoryItem[index].image,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                categoryItem[index].name,
                                style: TextStyle(
                                    fontWeight: selectedCatogory
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (_) => postDetails());
                    Navigator.push(context, route);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    //width: MediaQuery.of(context).size.width - 200,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),

                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: petList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 230,
                                      width: 300,
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: shadowList,
                                      ),
                                      margin: EdgeInsets.only(top: 50),
                                      child: Image.asset(
                                        petList[index].image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 45),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (isFavorite) {
                                                isFavorite = false;
                                              } else {
                                                isFavorite = true;
                                              }
                                            });
                                          },
                                          icon: isFavorite
                                              ? Icon(
                                                  Icons.favorite,
                                                  size: 26,
                                                  color: Colors.black,
                                                )
                                              : Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  size: 26,
                                                  color: Colors.black,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 170,
                                  margin: EdgeInsets.only(
                                    top: 60,
                                    bottom: 20,
                                  ),
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    boxShadow: shadowList,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 7),
                                            child: Text(
                                              petList[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              style: kTitleStyle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 8, top: 7),
                                            child: Icon(
                                              FontAwesomeIcons.venus,
                                              color: kText2Color,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        petList[index].type,
                                        style: kSubtitleStyle,
                                      ),
                                      Text(
                                        "${petList[index].age} Years Old",
                                        style: kSubtitle2Style,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.mapMarkedAlt,
                                            color: kPrimaryColor,
                                            size: 15.0,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            petList[index].location,
                                            style: kSubtitle2Style,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
