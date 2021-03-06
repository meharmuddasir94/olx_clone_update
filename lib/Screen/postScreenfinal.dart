
import 'package:flutter/material.dart';

import '../configuration.dart';

class postScreenFinal extends StatefulWidget {
  @override
  _postScreenFinalState createState() => _postScreenFinalState();
}

class _postScreenFinalState extends State<postScreenFinal> {
  String chooseValue = " Dog";

  List _categoryList = [" Dog", " Cat", " Bird", " Bunny", " Horse", " Fish"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("Post an  AD"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [primaryGreen, Colors.blueAccent]),
                    ),
                  ),
                  Positioned(
                    top: 155,
                    bottom: 0,
                    left: 295,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: null,
                        child: Icon(
                          Icons.camera_enhance,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 155,
                    bottom: 0,
                    left: 340,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: null,
                        child: Icon(
                          Icons.file_copy_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10,

                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: "Enter Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.account_box_outlined)),
              ),
            ),
            Container(
              height: 50,alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10,left: 8,),
              padding: EdgeInsets.all(8),
              child: Text(
                "Select Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10,

                right: 20,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton(

                  dropdownColor: Colors.white,
                  hint: Text("Select Category"),
                  value: chooseValue,
                  isExpanded: true,

                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  ),

                  items: _categoryList.map<DropdownMenuItem<String>>((value){
                    return DropdownMenuItem <String>(

                      child: Text(value),
                      value: value,);
                  }).toList(),
                  onChanged: (value) {

                    setState(() {
                      String value1=value.toString();
                      chooseValue = value1;
                    });
                  },
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                left: 10,
                top: 30,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Enter Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                  ),
                ),
              ),
            ),
            Container(
              height: 30,alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10,left: 8),
              padding: EdgeInsets.all(8),
              child: Text(
                "Price",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: MediaQuery.of(context).size.width/2,
                    margin: EdgeInsets.only(
                      left: 10,
                      // right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Min Price",
                        border:InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 70,
                  width: MediaQuery.of(context).size.width/2,
                  margin: EdgeInsets.only(
                    left: 10,

                    //right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Max Price",
                      border:InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,

                    ),
                  ),
                ),

              ],),


              Container(
                height: 70,
                margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 30),
width: MediaQuery.of(context).size.width-10,
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                  onPressed: null,
                  hoverColor: Colors.grey,
                  child: Text("Submit",
                    style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
                  
                ),
              ),


          ],
        ),
      ),
    );
  }
}
