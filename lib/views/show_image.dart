import 'package:flutter/material.dart';
import 'dart:io';

class ShowImageScreen extends StatefulWidget {
  final File parentImage;
  ShowImageScreen({Key key, @required this.parentImage}) : super(key: key);

  @override
  _ShowImageScreenState createState() => _ShowImageScreenState();
}

class _ShowImageScreenState extends State<ShowImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(widget.parentImage),
              ),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Enter text"),
                      ),
                    )))),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //       height: 50,
      //       child: Padding(
      //         padding: EdgeInsets.all(10),
      //         child: TextField(
      //           decoration: InputDecoration(
      //               border: InputBorder.none, hintText: "Enter text"),
      //         ),
      //       )),
      // )
    );
  }
}
