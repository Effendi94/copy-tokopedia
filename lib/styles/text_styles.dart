import 'package:copy_tokopedia/core.dart';

class TextStyles {
  static TextStyle elevatedButton = const TextStyle(
    fontFamily: robotoBold,
    fontSize: 16,
  );

  static TextStyle textButton = const TextStyle(
    fontFamily: robotoBold,
    fontSize: 14,
  );

  static TextStyle defaults = const TextStyle(
    fontFamily: robotoRegular,
    fontSize: 14,
  );

  static TextStyle danger = TextStyle(
    fontFamily: robotoRegular,
    fontSize: 14,
    color: MyColors.danger,
  );

  static TextStyle title = TextStyle(
    fontFamily: robotoBold,
    fontSize: 18,
    color: MyColors.black,
  );

  static TextStyle subTitle = const TextStyle(
    fontFamily: robotoSemiBold,
    fontSize: 14,
  );

  static TextStyle inputLabel = const TextStyle(
    fontFamily: robotoMedium,
    fontSize: 12,
  );

  static TextStyle inputHint = const TextStyle(
    fontFamily: robotoLight,
    fontSize: 12,
  );

  static TextStyle inputError = TextStyle(
    fontFamily: robotoSemiBold,
    fontSize: 12,
    color: MyColors.danger,
  );
}
