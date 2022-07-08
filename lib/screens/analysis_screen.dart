import 'package:flutter/material.dart';
import '../utilities/data_container.dart';

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
          } 
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Loading..."),
                ],
              )
            );
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