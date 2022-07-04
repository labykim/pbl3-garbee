import 'package:image_picker/image_picker.dart';

Future<XFile?> imageProcess() {
  return ImagePicker().pickImage(source: ImageSource.gallery);
}