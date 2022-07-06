import 'dart:io' as io;
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
    _apiResult = await googleVisionLabel(_image);
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