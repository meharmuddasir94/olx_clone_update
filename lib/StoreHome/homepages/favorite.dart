import 'package:flutter/material.dart';

class favorite extends StatefulWidget {
  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
    );
  }
}
