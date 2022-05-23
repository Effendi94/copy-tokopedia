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
    fontSize: 13,
  );

  static TextStyle title = const TextStyle(
    fontFamily: robotoBold,
    fontSize: 18,
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
    color: MyColors.danger,
  );
}
