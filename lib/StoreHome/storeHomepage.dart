import 'package:flutter/material.dart';

class storeHomepage extends StatefulWidget {
  @override
  _storeHomepageState createState() => _storeHomepageState();
}

class _storeHomepageState extends State<storeHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(),
      appBar: AppBar(title: Text("Homepage"),backgroundColor: Colors.transparent,),
      
    );
  }
}
