// package imports:
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

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
    _initAppLocale();
    _initAppTheme();
    appOneSignalActivated
        ? _initOneSignal()
        : debugPrint('OneSignal Not Activated');
  }

  @override
  dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
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

  void _initOneSignal() async {
    if (!mounted) return;
    debugPrint('---------------OneSignal Init---------------');
    await Permission.notification.status.then((status) {
      if (!status.isGranted) {
        debugPrint("NOTIFICATION PERMISION IS NOT GRANTED");
      }
    });

    await OneSignal.shared.setAppId(oneSignalAppID);

    await OneSignal.shared.setRequiresUserPrivacyConsent(false);

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      debugPrint(
          "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      debugPrint(
          "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      debugPrint("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      debugPrint("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      debugPrint(
          "EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });
  }

  void _initAppLocale() async {
    var res = await getStorage(langKey);
    if (res == null) {
      putStorage(langKey, "ID");
      res = "ID";
    }
    // debugPrint("lang: $res");
    var locale = Locale('en', res);
    Get.updateLocale(locale);
  }

  void _initAppTheme() async {
    var res = await getBoolStorage(darkModeKey);
    if (res == null) {
      putBoolStorage(darkModeKey, false);
      res = false;
    }
    Get.changeTheme(res ? ThemeConfig.darkTheme : ThemeConfig.lightTheme);
  }
}
