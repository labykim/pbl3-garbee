import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'api_request.dart';
import 'display_photo.dart';
// import 'splash_screen.dart';    <<<  is not coded yet

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'GarBEE',
      home: Scaffold(
        
        body: const SelectImageButton(),
        
        bottomNavigationBar: BottomAppBar(
        ),
      )
    );
  }
}

class SelectImageButton extends StatefulWidget {
  const SelectImageButton({Key? key}) : super(key: key);

  @override
  State<SelectImageButton> createState() => SelectImageButtonState();
}

class SelectImageButtonState extends State<SelectImageButton> {
  var imagePath;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 30),
      minimumSize: Size(200, 100),
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () async {
              var image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if(image == null) return; // Maybe add some lines for this part later

              var googleOutput = await googleVision(image);

              setState(() {
                imagePath = io.File(image.path);
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) => 
                  AnalysisScreen(imagePath, googleOutput))
                );
              });
            },
            child: const Text('Select from Gallery'),
          ),
        ],
      ),
    );
  }
}

Future imageProcess() async {
  XFile? imageSelected = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(imageSelected == null) return null;
  
  io.File imagePath = io.File(imageSelected.path);
  var apiOutput = await googleVision(imageSelected);

  return imagePath;
}

class DataContainer {
  var _imageData;
  List _list = [];
  DataContainer(imageData, list) {
    _imageData = imageData;
    _list = list;
  }

  dynamic getImage() {
    return _imageData;
  }
  List getList() {
    return _list;
  }
}