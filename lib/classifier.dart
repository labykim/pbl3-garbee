dynamic classifier(List<String> input) {
  List<String> output = [];



  Map<String, String> findCategory = {
    "Plastic bottle" : "PET",
    "Paper cup" : "Combustible",
    "Instant noodle" : "Combustible",
    "Pen" : "Plastics",
    "Packaged goods" : "",
    "Tumbler" : "",
    "Bottle" : "null",
  };

  if(output == "null") {
    return null;
  }

  Map<String, List<String>> findInstruction = {
    "Plastics" : [""],
    "PET" : ["1. Separate the cap and the label.", "2. Bottle to PET, cap and label to plastics."],
  };



  return output;
}