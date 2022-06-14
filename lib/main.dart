import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'display_photo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'GarBee',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          elevation: 0,
          title: Text('PBL3 Group 6: GarBee'),
          centerTitle: true,
        ),

        body: const MyStatefulWidget(),
        
        bottomNavigationBar: BottomAppBar(
        ),
      )
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => FirstButtonClass();
}

class FirstButtonClass extends State<MyStatefulWidget> {

  var userImage;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 40),
        minimumSize: Size(200, 100));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if(image !=null){
                setState(() {
                userImage = File(image.path);

                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) => DisplayPhoto(userImage)));
                });
              }
            },
            child: const Text('Upload a photo'),
          ),
        ],
      ),
    );
  }
}