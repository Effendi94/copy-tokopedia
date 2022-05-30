import 'package:copy_tokopedia/core.dart';

void dismissTextFieldFocus(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
}

String obfuscatePhoneNumber(String text) {
  var result = '****-****-';
  result += text.substring(text.length - 3, text.length);
  return result;
}
