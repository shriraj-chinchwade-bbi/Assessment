import 'dart:ui';

Color colorFromHex(String hexColor) {
  return Color(int.parse(hexColor.replaceAll("#", "0xff")));
}
