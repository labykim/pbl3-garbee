import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
<<<<<<< HEAD

=======
>>>>>>> ca19b506c285e5c76794e62c2321b2bc47090c30
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
<<<<<<< HEAD
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
=======
      home: Text('Hello')
>>>>>>> ca19b506c285e5c76794e62c2321b2bc47090c30
    );

  }
}