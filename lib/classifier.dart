import 'data/find_category.dart';
import 'data/find_instruction.dart';

// Returns a category and detailed instructions
List<String>? classifier(List<String> objectList) {
  List<String> output = [];
  String? tmp;

  tmp = getCategory(objectList);
  if(tmp == null) return null;

  output[0] = tmp;
  output.addAll(getInstruction(output[0]));
  
  return output;
}

String? getCategory(List<String> objectList) {
  for(int i=0; i<objectList.length; i++) {
    if(findCategory.containsKey(objectList[i])) {
      return findCategory[objectList[i]];
    }
  }
  return null;
}

List<String> getInstruction(String category) {
  return findInstruction[category]!;
}