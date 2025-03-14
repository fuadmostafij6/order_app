

import 'package:flutter/material.dart';

class AppColors {

  AppColors._();

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color primary = hexToColor("#ff6500");
  static Color secondary = hexToColor("#ffdac1");
  //Gray
  static Color gray25 = hexToColor('#FCFCFD');
  static Color gray50 = hexToColor('#F6F6F6');
  static Color gray100 = hexToColor('#EBEBEB');
  static Color gray200 = hexToColor('#DBDBDB');
  static Color gray300 = hexToColor('#BFBFBF');
  static Color gray400 = hexToColor('#9C9C9C');
  static Color gray500 = hexToColor('#7A7A7A');
  static Color gray600 = hexToColor('#5E5E5E');
  static Color gray700 = hexToColor('#4D4D4D');
  static Color gray800 = hexToColor('#424242');
  static Color gray900 = hexToColor('#303030');
  static Color gray950 = hexToColor('#252222');

  //Brand
  static Color brand25 = hexToColor('#FAFCFF');
  static Color brand50 = hexToColor('#FEF2F2');
  static Color brand100 = hexToColor('#EBEBEB');
  static Color brand200 = hexToColor('#FDCBCD');
  static Color brand300 = hexToColor('#FAA7AA');
  static Color brand400 = hexToColor('#F57478');
  static Color brand500 = hexToColor('#DB5156');
  static Color brand600 = hexToColor('#D42B31');
  static Color brand700 = hexToColor('#B52025');
  static Color brand800 = hexToColor('#961E22');
  static Color brand900 = hexToColor('#67191B');
  static Color brand950 = hexToColor('#520F11');


  //Error
  static Color error25 = hexToColor('#FFFBFA');
  static Color error50 = hexToColor('#FEF3F2');
  static Color error100 = hexToColor('#FDE3E4');
  static Color error200 = hexToColor('#FDCBCD');
  static Color error300 = hexToColor('#FAA7AA');
  static Color error400 = hexToColor('#F57478');
  static Color error500 = hexToColor('#DB5156');
  static Color error600 = hexToColor('#D42B31');
  static Color error700 = hexToColor('#B52025');
  static Color error800 = hexToColor('#961E22');
  static Color error900 = hexToColor('#67191B');
  static Color error950 = hexToColor('#520F11');

//warning
  static Color warning25 = hexToColor('#FFFBFA');
  static Color warning50 = hexToColor('#FFF9ED');
  static Color warning100 = hexToColor('#FFF2D5');
  static Color warning200 = hexToColor('#FFE1A9');
  static Color warning300 = hexToColor('#FECB74');
  static Color warning400 = hexToColor('#FB8F14');
  static Color warning500 = hexToColor('#FB8F14');
  static Color warning600 = hexToColor('#EC720A');
  static Color warning700 = hexToColor('#C4560A');
  static Color warning800 = hexToColor('#9B4311');
  static Color warning900 = hexToColor('#5A2A0C');
  static Color warning950 = hexToColor('#431904');

  //success
  static Color success50 = hexToColor('#E7FEDD');
  static Color success100 = hexToColor('#DAFBCB');
  static Color success200 = hexToColor('#B7F29C');
  static Color success300 = hexToColor('#9CE779');
  static Color success400 = hexToColor('#67CD37');
  static Color success500 = hexToColor('#4BA720');
  static Color success600 = hexToColor('#398217');
  static Color success700 = hexToColor('#2D6911');
  static Color success800 = hexToColor('#285A11');
  static Color success900 = hexToColor('#1F430F');
  static Color success950 = hexToColor('#153008');


//info
  static Color info50 = hexToColor('#ECF6FF');
  static Color info100 = hexToColor('#DCEFFF');
  static Color info200 = hexToColor('#C0DEFC');
  static Color info300 = hexToColor('#A3CBFA');
  static Color info400 = hexToColor('#73A5F7');
  static Color info500 = hexToColor('#4D7EEF');
  static Color info600 = hexToColor('#345CEA');
  static Color info700 = hexToColor('#2649D9');
  static Color info800 = hexToColor('#2041B6');
  static Color info900 = hexToColor('#1B3279');
  static Color info950 = hexToColor('#152251');

  //blue
  static Color blue50 = hexToColor('#ECF6FF');
  static Color blue100 = hexToColor('#DCEFFF');
  static Color blue200 = hexToColor('#C0DEFC');
  static Color blue300 = hexToColor('#A3CBFA');
  static Color blue400 = hexToColor('#73A5F7');
  static Color blue500 = hexToColor('#4D7EEF');
  static Color blue600 = hexToColor('#345CEA');
  static Color blue700 = hexToColor('#2649D9');
  static Color blue800 = hexToColor('#2041B6');
  static Color blue900 = hexToColor('#1B3279');
  static Color blue950 = hexToColor('#152251');



}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}