import 'dart:html';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class postScreen2 extends StatefulWidget {
  @override
  _postScreen2State createState() => _postScreen2State();
}

class _postScreen2State extends State<postScreen2> {
  Color backgrund = Color(0xfffafafa);
  final picker = ImagePicker();
 // File image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
       // image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double mainHeight = size.height;
    final double mainWidth = size.width;
    return Scaffold(
      backgroundColor: backgrund,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
        ),
        title: Text("Include some details"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: mainHeight,
            width: mainWidth,
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 8,
                  right: 8,
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.bottomRight)),
                    child: Center(
                      child: Text("Add Pictures"),
                    ),
                  ),
                ),
                Positioned(
                  top: 165,
                  left: MediaQuery.of(context).size.width - 108,
                  right: 5,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.camera_alt_sharp,
                            size: 25,
                            color: Colors.black,
                          )),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.file_copy,
                            size: 25,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                Positioned(
                    top: 220,
                    left: 2,
                    right: 2,
                    child: TextField(
                      maxLines: 1,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
