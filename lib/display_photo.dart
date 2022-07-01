import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  final imagePath;
  final googleOutput;
  
  AnalysisScreen(this.imagePath, 
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
            Image.file(imagePath),
            // Text(googleOutput[0]),
            // Add list view here
          ],
        )
      )
    );
  }
}