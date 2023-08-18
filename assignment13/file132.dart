

String secret_key(String input_str) {
  String last_4_character = input_str.substring(input_str.length - 4);
  String output = "";
  List<int> skip_length = [];
  for (int i = 0; i < last_4_character.length; i++) {
    skip_length.add(int.parse(last_4_character[i]));
  }
  int index = 0;
  for (int skip in skip_length) {
    index += skip;
    output += input_str.substring(index, index + 8);
    index += 8;
  }
  return output;
}

void main() {
  String input_str ="2TZ1C1N1NJSNAOETOP7T8N4FZEULH3DJKZH7PDLP3C54JJKDOTUIPEGO8097";
  print(secret_key(input_str));
}

