import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  //const DisplayPhoto({Key? key}) : super(key: key);

  var userImage;

  DisplayPhoto(var userImage) {
    this.userImage = userImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen B"),
      ),

      body: Image.file(userImage),
    );
  }
}