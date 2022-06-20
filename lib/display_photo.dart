import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  var userImage;
  var kakaoOutput, googleOutput;
  AnalysisScreen(this.userImage, this.kakaoOutput, this.googleOutput, 
    {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis results"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(userImage),
            Text(kakaoOutput),
            Text('---------------------------'),
            Text(googleOutput)
          ],
        )
      )
    );
  }
}