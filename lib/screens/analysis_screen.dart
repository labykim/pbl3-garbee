import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../api/api_request.dart';

class DataContainer {
  static var _image;
  static var _imagePath;
  static var _apiResult;
  
  static void setImageSelected(XFile input) async {
    _image = input;
    _imagePath = io.File(_image.path);
  }
  static void setApiResult() async {
    _apiResult = await googleVision(_image);
  }
  
  static dynamic getImage() {
    return _image;
  }
  static dynamic getImagePath() {
    return _imagePath;
  }
  static dynamic getApiResult() {
    return _apiResult;
  }
}

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis results"),
      ),
      body: DisplayImage(),
    );
  }
}

class DisplayImage extends StatefulWidget {
  const DisplayImage({Key? key}) : super(key: key);

  @override
  State<DisplayImage> createState() => DisplayImageState();
}

class DisplayImageState extends State<DisplayImage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: DataContainer.getApiResult().length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.deepPurple,
                child: Center(child: Text(DataContainer.getApiResult()[index])),
              );
            }
          )
          // Text("test"),
          // Image.file(DataContainer.getImagePath()),
          // Text(DataContainer.getApiResult().toString()),
        ],
      )
    );
  }
}

/*
class AnalysisScreenPast extends StatelessWidget {
  final imagePath;
  final googleOutput;
  
  AnalysisScreenPast(this.imagePath, 
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
          ],
        )
      )
    );
  }
} */