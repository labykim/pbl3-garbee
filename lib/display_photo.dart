import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  //const DisplayPhoto({Key? key}) : super(key: key);
  // If uncomment line 4, it conflicts with line 9 constructor

  var userImage;

  DisplayPhoto(var userImage) {
    this.userImage = userImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uploaded photo"),
      ),

      body: Image.file(userImage),
    );
  }
}