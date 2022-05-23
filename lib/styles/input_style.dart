import 'package:copy_tokopedia/core.dart';

class InputStyles {
  static InputBorder borderDefault = OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColors.grey,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  static InputBorder borderError = OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColors.danger,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  static InputBorder borderActive = OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColors.appPrimaryColors,
    ),
    borderRadius: BorderRadius.circular(15),
  );
}
