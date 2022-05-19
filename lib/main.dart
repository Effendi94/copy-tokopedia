import 'package:package_info_plus/package_info_plus.dart';

import 'core.dart';
import 'lang/trans_services.dart';

const ColorScheme colorScheme = ColorScheme(
  primary: MyColors.appPrimaryColors,
  onPrimary: Colors.white,
  primaryContainer: MyColors.appPrimaryColors,
  secondary: Colors.red,
  secondaryContainer: Colors.redAccent,
  surface: Colors.white,
  onSurface: Colors.white,
  background: Colors.grey,
  error: Colors.redAccent,
  onError: Colors.red,
  onSecondary: Colors.redAccent,
  onBackground: Colors.grey,
  brightness: Brightness.light,
);

final ThemeData kLightTheme = ThemeData.light().copyWith(
  colorScheme: colorScheme,
);

final ThemeData kDarkTheme = ThemeData.dark().copyWith(
  colorScheme: colorScheme,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late String appVersion = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _getAppInfo();
    initAppLocale();
    initAppTheme();
  }

  void initAppLocale() async {
    var res = await getStorage(langKey);
    if (res == null) {
      putStorage(langKey, "ID");
      res = "ID";
    }
    debugPrint("lang: $res");
    var locale = Locale('en', res);
    Get.updateLocale(locale);
  }

  void initAppTheme() async {
    var res = await getBoolStorage(darkModeKey);
    debugPrint('$res');
    if (res == null) {
      putBoolStorage(darkModeKey, false);
      res = false;
    }
    Get.changeTheme(res ? ThemeData.dark() : ThemeData.light());
  }

  Future<void> _getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var buildNumber = appDev ? "+" + packageInfo.buildNumber : "";
    appVersion = packageInfo.version + buildNumber;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '$appName $secondaryAppName',
      theme: Get.isDarkMode ? kDarkTheme : kLightTheme,
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      home: SplashScreen(
        appVersion: appVersion,
      ),
    );
  }
}
