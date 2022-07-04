import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/api_request.dart';
import '../utilities/classifier.dart';

class DataContainer {
  static var _image;        // XFile
  static var _imagePath;
  static var _apiResult;    // List<String>
  static var _instruction;  // List<String>
  
  static Future initiate(XFile input) async {
    _image = input;
    _imagePath = io.File(_image.path);
    setResults();
  }
  static Future setResults() async {
    _apiResult = await googleVision(_image);
    if(_apiResult != null) _instruction = classifier(_apiResult);
    return await _instruction;
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
  static dynamic getInstruction() {
    return _instruction;
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
      body: FutureBuilder(
        future: DataContainer.setResults(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.file(DataContainer.getImagePath()),
                  Text(DataContainer.getApiResult().toString()),
                  Text(DataContainer.getInstruction().toString()),
                ],
              )
            );
            // return DisplayImage();
          } 
          else {
            return CircularProgressIndicator();
          }
        },
      )
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
        ],
      )
    );
  }
}