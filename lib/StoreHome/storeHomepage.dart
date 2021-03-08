import 'package:flutter/material.dart';

class storeHomepage extends StatefulWidget {
  @override
  _storeHomepageState createState() => _storeHomepageState();
}

class _storeHomepageState extends State<storeHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Homepage"),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Row(children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Icon(Icons.home),
        )
      ]),
    );
  }
}
