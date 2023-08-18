
String secretKey(String inputStr) {
  String last4Character = inputStr.substring(inputStr.length - 4);
  List<int> skipLength = [];
  for (int i = 0; i < last4Character.length; i++) {
    skipLength.add(int.parse(last4Character[i]));
  }
  int index = 0;
  List<String> outputArr = [];
  for (int skip in skipLength) {
    index += skip;
    outputArr.add(inputStr.substring(index, index + 4));
    index += 4;
  }
  String output = outputArr.reversed.join('');
  return output;
}

void main() {
  String inputStr = "EJLGNAGS9GLI87RLW8RD0460CUZD8103";
  print(secretKey(inputStr));
}
