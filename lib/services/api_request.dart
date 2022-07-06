import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../data/api_key.dart';

Future<List<String>> googleVision(var inputImage) async {
  String endpoint = 'https://vision.googleapis.com/v1/images:annotate';
  String key = ApiKey.getGoogle();
  String uri = '$endpoint?key=$key';
  Uri parsedUri = Uri.parse(uri);
  
  Uint8List byteImage = await inputImage.readAsBytes();
  String base64Image = base64.encode(byteImage);

  var request = http.post(
    parsedUri,
    headers: <String, String>{
      'Content-Type': 'application/json',
      'charset': 'utf-8'
    },
    body: jsonEncode(<String, dynamic> {
      'requests': {
        'image': {
          'content': base64Image
        },
        'features': {
          "type": "OBJECT_LOCALIZATION"
        }
      }
    })
  );
  http.Response response = await request;
  
  // Filtering the response
  var responseBody = jsonDecode(response.body);
  List<dynamic> annotationsList = responseBody['responses'][0]['localizedObjectAnnotations'];
  List<String> detectedObjectList = [];

  for(int i=0; i<annotationsList.length; i++) {
    detectedObjectList.add(annotationsList[i]['name']);
  }
  // print(responseBody);
  // print(detectedObjectList);
  return detectedObjectList;
}

Future<String> kakaoVision(var inputImage) async {
  Uri uri = Uri.parse('https://dapi.kakao.com/v2/vision/product/detect');

  var request = http.MultipartRequest('POST', uri)
  ..headers.addAll({'Authorization': ApiKey.getKakao()})
  ..files.add(await http.MultipartFile.fromPath('image', inputImage));
  // http.MultipartRequest is a 'multipart/form-data' request
  // so it does not require to add a 'Content-Type' header
  
  var response = await request.send();
  http.Response responseJSON = await http.Response.fromStream(response);

  return responseJSON.body;
}