import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'screens/analysis_screen.dart';

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
              XFile? imageSelected = await imageProcess();
              if(imageSelected == null) return; // Add pop-up message here
              DataContainer.setImageSelected(imageSelected);
              if(DataContainer.getApiResult() == null) return;
              DataContainer.setApiResult();
              setState(() {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) => AnalysisScreen())
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

Future<XFile?> imageProcess() async {
  XFile? imageSelected = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(imageSelected == null) return null;

  return imageSelected;
}