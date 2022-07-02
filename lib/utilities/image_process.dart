import 'package:image_picker/image_picker.dart';

Future<XFile?> imageProcess() async {
  XFile? imageSelected = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(imageSelected == null) return null;

  return imageSelected;
}