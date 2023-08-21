// import 'dart:io';

dynamic numToCheque(int number) {
//     String lessThanThousand(int number) {
  List<String> ones = [
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
  ];
  List<String> tens = [
    '',
    '',
    'twenty',
    'thirty',
    'fourty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninty'
  ];
  dynamic lessThanThousand(int number) {
    if (number < 20) {
      return ones[number];
    } else if (number < 100) {
      return tens[number ~/ 10] + " " + ones[number % 10];

      // return '${tens[number~/10]} ${ones[number%10]}';
    } else if (number < 1000) {
      if ((number % 100) ~/ 10 == 1) {
        return ones[number ~/ 100] + " Hundred " + ones[(number % 100)];
      } else {
        return ones[number ~/ 100] +
            " Hundred " +
            tens[(number % 100) ~/ 10] +
            ' ' +
            ones[(number % 100) % 10];
      }
    }
  }

  if (number == 0) {
    return 'zero';
  }
  List<String> thousands = [
    '',
    'thousand',
    'million',
    'billion',
    'trillion',
    'quadrillion'
  ];
  String result = "";
  int index = 0;
  while (number > 0) {
    int segment = number % 1000;
    if (segment == 0) {
      segment = number ~/ 1000;
      return lessThanThousand(segment) + ' thousand';
    } else {
      if (segment > 0) {
        if (index > 0) {
          result =
              lessThanThousand(segment) + ' ' + thousands[index] + " " + result;
        } else {
          result = lessThanThousand(segment) + ' ' + result;
        }
      }
      number = number ~/ 1000;
      index += 1;
    }
  }
  return result;
}

void main() {
  // int number = int.parse(stdin.readLineSync()!);
  int number = 999999999999999999;
  print(numToCheque(number));
}
// output: nine Hundred ninty nine quadrillion 
//nine Hundred ninty nine trillion 
//nine Hundred ninty nine billion 
//nine Hundred ninty nine million 
//nine Hundred ninty nine thousand 
//nine Hundred ninty nine 
