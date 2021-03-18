import 'package:flutter/material.dart';
import 'package:olx_clone/configuration.dart';
import 'package:olx_clone/tabScreens/favorite.dart';
import 'package:olx_clone/tabScreens/myads.dart';

class myADs extends StatefulWidget {
  @override
  _myADsState createState() => _myADsState();
}

class _myADsState extends State<myADs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "My Ads",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: primaryGreen,
            indicatorWeight: 7.0,
            tabs: [
              Tab(
                child: Text(
                  "ADs",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  "Favorites",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          myadsTab(),
          favoriteTab(),
        ]),
      ),
    );
  }
}
