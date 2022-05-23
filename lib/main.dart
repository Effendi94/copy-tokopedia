// package imports:
import 'package:package_info_plus/package_info_plus.dart';

// project imports
import 'core.dart';
import 'lang/trans_services.dart';

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
    WidgetsBinding.instance?.addObserver(this);
    _getAppInfo();
    initAppLocale();
    initAppTheme();
  }

  @override
  dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  void initAppLocale() async {
    var res = await getStorage(langKey);
    if (res == null) {
      putStorage(langKey, "ID");
      res = "ID";
    }
    // debugPrint("lang: $res");
    var locale = Locale('en', res);
    Get.updateLocale(locale);
  }

  void initAppTheme() async {
    var res = await getBoolStorage(darkModeKey);
    if (res == null) {
      putBoolStorage(darkModeKey, false);
      res = false;
    }
    Get.changeTheme(res ? ThemeConfig.darkTheme : ThemeConfig.lightTheme);
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
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      home: SplashScreen(
        appVersion: appVersion,
      ),
    );
  }
}
