import 'dart:math';

void main() {
  Random random = new Random();
  int randomNumber = random.nextInt(3) + 1; //random number in range [1,3].
  print('Random Number: $randomNumber');
  randomNum(randomNumber);

//   print(var1);
}

Future<void> randomNum(randomNumber) async {
  late String var1;
  int? var2;
  bool var3 =
      true; //can be just boolva3; but gets error The non-nullable local variable 'var3' must be assigned before it can be used.

  switch (randomNumber) {
    case 1:
      {
        var1 = randomNumber.toString();
        Future.delayed(
            const Duration(seconds: 2), () => print('first variable: $var1'));
      }
      break;
    case 2:
      {
        var2 = randomNumber;
        Future.delayed(
            const Duration(seconds: 2), () => print('second variable: $var2'));
      }
      break;
    case 3:
      {
        var3 = (!var3);
        Future.delayed(
            const Duration(seconds: 2), () => print('third variable: $var3'));
      }
      break;
  }
  try {
    var1;
  } catch (e) {
    Future.delayed(const Duration(seconds: 3),
        () => print('var1 not assigned, assigning to "notassigned" string'));
    var1 = "notassigned";
  }
  try {
    var2;
  } catch (e) {
    Future.delayed(const Duration(seconds: 3),
        () => print('var2 not assigned, assigning to '));
    var2 = 0;
  }
  try {
    if (var3 == true) ;
  } catch (e) {
    Future.delayed(
        const Duration(seconds: 3), () => print('var3 not assigned, '));
    var3 = false;
  }
  Future.delayed(const Duration(seconds: 4),
      () => print('all assigned: $var1 $var2 $var3 '));
}
