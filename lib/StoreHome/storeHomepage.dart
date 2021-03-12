import 'package:flutter/material.dart';
import 'package:olx_clone/Screen/postScreen1.dart';
import 'package:olx_clone/StoreHome/homepages/account.dart';
import 'package:olx_clone/StoreHome/homepages/chat.dart';
import 'package:olx_clone/StoreHome/homepages/dashboard.dart';
import 'package:olx_clone/StoreHome/homepages/favorite.dart';

class storeHomepage extends StatefulWidget {
  @override
  _storeHomepageState createState() => _storeHomepageState();
}

class _storeHomepageState extends State<storeHomepage> {
  int currentTab = 0;
  final List<Widget> screen = [
    dashboard(),
    account(),
    chat(),
    favorite(),
  ];
  Widget currentSCreen = dashboard();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (_) => postScreen1());
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageStorage(bucket: bucket, child: currentSCreen),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentSCreen = dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentSCreen = chat();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Chat",
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentSCreen = favorite();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Favorite",
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentSCreen = account();
                        currentTab = 3;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_box,
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
