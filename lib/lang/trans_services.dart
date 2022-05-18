// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'en_id.dart';
import 'en_us.dart';

class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'en_ID': enID,
      };
}
