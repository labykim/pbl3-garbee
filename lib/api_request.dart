import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'api_key.dart';

Future<String> kakaoVision(var inputImage) async {
  // Format: 'png' or 'jpg' *not sure
  // Under 2048px, maximum 2MB
  Uri uri = Uri.parse('https://dapi.kakao.com/v2/vision/product/detect');

  var request = http.MultipartRequest('POST', uri)
  // http.MultipartRequest is a 'multipart/form-data' request
  ..headers.addAll({'Authorization': ApiKey.getKakao()})
  ..files.add(await http.MultipartFile.fromPath('image', inputImage));
  
  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  print(responsed.body);

  return responsed.body;
}

Future<String> googleVision(var inputImage) async {
  String uri = 'https://vision.googleapis.com/v1/images:annotate';
  String key = ApiKey.getGoogle();
  String uriAndKey = '$uri?key=$key';
  Uri inputUri = Uri.parse(uriAndKey);
  
  Uint8List byteImage = await inputImage.readAsBytes();
  String base64Image = base64.encode(byteImage);

  var request = http.post(
    inputUri,
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
  final response = await request;
  
  print(response.statusCode);
  print(response.body);

  return response.body;
}

// ---------------References---------------
// https://stackoverflow.com/questions/67314634/flutter-upload-file-through-rest-api-endpoint
// https://stackoverflow.com/questions/49125191/how-to-upload-images-and-file-to-a-server-in-flutter
// https://pub.dev/documentation/http/latest/http/MultipartRequest-class.html
// https://pub.dev/documentation/http/latest/http/MultipartFile-class.html
// https://medium.com/nerd-for-tech/multipartrequest-in-http-for-sending-images-videos-via-post-request-in-flutter-e689a46471ab

// https://cloud.google.com/vision/docs/object-localizer?hl=ko#detect_objects_in_a_local_image
