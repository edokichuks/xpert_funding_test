// Flutter imports:
import 'package:flutter/material.dart';

class AppColors {
  //SnappyPay Colors

  //Body
  static Color defaultBG = _fromHex('#111111');
  //WHITE
  static Color white = _fromHex('#FFFFFF');
  static Color white100 = _fromHex('#F3F2F5');

  //GREY
  static Color greyDesktop = _fromHex('#F8F8F9');
  static Color greyMobile = _fromHex('#FAFAFA');
  static Color darkgreyMobile = _fromHex('#1A1A1A');
  static Color stroke = _fromHex('#F2F2F2');

  //LIGHT MODE
  static Color defaultBackgroundLight = _fromHex('#F8F8FB');
  static Color defaultOverlayLight = _fromHex('#FFFFFF');
  //DARK MODE
  static Color defaultBackgroundDark = _fromHex('#111111');
  static Color defaultOverlaydDark = _fromHex('#171B20');

  //NEUTRAL
  static Color neutral50 = _fromHex('#E7E7E7');
  static Color neutral100 = _fromHex('#B5B5B5');
  static Color neutral200 = _fromHex('#929292');
  static Color neutral300 = _fromHex('#606060');
  static Color neutral400 = _fromHex('#414141');
  static Color neutral500 = _fromHex('#111111');
  static Color neutral600 = _fromHex('#0F0F0F');
  static Color neutral700 = _fromHex('#070707');
  static Color neutral800 = _fromHex('#090909');
  static Color neutral900 = _fromHex('#070707');

  //PRIMARY
  static Color primary50 = _fromHex('#FFFAE9');
  static Color primary75 = _fromHex('#FEE9A6');
  static Color primary100 = _fromHex('#000F33');
  static Color primary200 = _fromHex('#FDD34A');
  static Color primary300 = _fromHex('#000F33');
  static Color primary400 = _fromHex('#B18D1A');
  static Color primary500 = _fromHex('#9A7B17');

  //SECONDARY
  static Color secondary50 = _fromHex('#F8EFF0');
  static Color secondary75 = _fromHex('#E1BEC0');
  static Color secondary100 = _fromHex('#D5A3A6');
  static Color secondary200 = _fromHex('#C27B80');
  static Color secondary300 = _fromHex('#B66066');
  static Color secondary400 = _fromHex('#7F4347');
  static Color secondary500 = _fromHex('#6F3B3E');

  //SUCCESS
  static Color success50 = _fromHex('#E9F8EE');
  static Color success75 = _fromHex('#A4E2BB');
  static Color success100 = _fromHex('#7ED69E');
  static Color success200 = _fromHex('#46C474');
  static Color success300 = _fromHex('#20B858');
  static Color success400 = _fromHex('#16813E');
  static Color success500 = _fromHex('#147036');

  //DANGER
  static Color danger50 = _fromHex('#FDE7E7');
  static Color danger75 = _fromHex('#F89E9E');
  static Color danger100 = _fromHex('#F67676');
  static Color danger200 = _fromHex('#F23A3A');
  static Color danger300 = _fromHex('#EF1212');
  static Color danger400 = _fromHex('#A70D0D');
  static Color danger500 = _fromHex('#920B0B');

  //WARNING
  static Color warning50 = _fromHex('#FFF9E6');
  static Color warning75 = _fromHex('#FFE597');
  static Color warning100 = _fromHex('#FFDA6C');
  static Color warning200 = _fromHex('#FFCB2C');
  static Color warning300 = _fromHex('#FFC001');
  static Color warning400 = _fromHex('#B38601');
  static Color warning500 = _fromHex('#9C7501');

  //INFO
  static Color info50 = _fromHex('#E7F6FD');
  static Color info75 = _fromHex('#9CDAF6');
  static Color info100 = _fromHex('#73CBF2');
  static Color info200 = _fromHex('#37B4ED');
  static Color info300 = _fromHex('#0EA5E9');
  static Color info400 = _fromHex('#0A73A3');
  static Color info500 = _fromHex('#09658E');

  //Random Colors
  static Color charcoalGrey = _fromHex('#404852');
  static const Color starColor = Color.fromRGBO(255, 151, 0, 1);
  static Color transparent = Colors.transparent;
}

Color _fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
