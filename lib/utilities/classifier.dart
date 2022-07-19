import 'package:pbl3_garbee/utilities/data_container.dart';

import '../data/map_category.dart';
import '../data/map_instruction.dart';

// Returns a category and detailed instructions
List<String>? classifier(List<String> objectList) {
  List<String> output = [];
  String? category;

  category = getCategory(objectList);
  if(category == null) return null;

  output.add(category);
  output.addAll(getInstruction(output[0]));
  
  return output;
}

String? getCategory(List<String> objectList) {
  for(int i=0; i<objectList.length; i++) {
    if(findCategory.containsKey(objectList[i])) {
      DataContainer.setHitIndex(i);
      return findCategory[objectList[i]];
    }
  }
  return null;
}

List<String> getInstruction(String category) {
  return findInstruction[category]!;
}