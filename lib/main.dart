import 'package:flutter/material.dart';

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

        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.star),
            Icon(Icons.circle),
            Icon(Icons.star),
            Icon(Icons.rectangle),
            Icon(Icons.star)
          ],
        ),
        
        bottomNavigationBar: BottomAppBar(),
      )
    );

  }
}