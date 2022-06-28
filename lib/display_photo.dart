import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  final userImage;
  final googleOutput;
  AnalysisScreen(this.userImage, 
                this.googleOutput, 
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
            Text(googleOutput[0]),    // Add list view here
          ],
        )
      )
    );
  }
}