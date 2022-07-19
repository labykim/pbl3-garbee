import 'dart:io' as io;
import 'package:image_picker/image_picker.dart';
import '../services/api_request.dart';
import '../utilities/classifier.dart';

class DataContainer {
  static var _image;        // XFile
  static var _imagePath;
  static var _apiResult;    // List<String>
  static var _instruction;  // List<String>
  static int _hitIndex = 0;
  
  static Future initiate(XFile input) async {
    _image = input;
    _imagePath = io.File(_image.path);
    setResults();
  }
  static Future setResults() async {
    _apiResult = await googleVisionLabel(_image);
    if(_apiResult == null) {
      // Exception handling
      // No detected objects
    } else {
      _instruction = classifier(_apiResult);
      _instruction ??= ["No detected objects. Please try with other images or retake it."];
    }
    return await _instruction;
  }
  static void setHitIndex(int hitIndex) {
    _hitIndex = hitIndex;
  }

  static dynamic getImage() {
    return _image;
  }
  static dynamic getImagePath() {
    return _imagePath;
  }
  static List<String> getApiResult() {
    return _apiResult;
  }
  static dynamic getInstruction() {
    return _instruction;
  }
  static int getHitIndex() {
    return _hitIndex;
  }
}