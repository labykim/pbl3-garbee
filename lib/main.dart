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
      title: 'GarBee',
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

  var userImage;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 40),
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

              var kakaoOutput = await kakaoVision(image.path);
              var googleOutput = await googleVision(image);

              setState(() {
                userImage = io.File(image.path);
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) => 
                  AnalysisScreen(userImage, kakaoOutput, googleOutput))
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