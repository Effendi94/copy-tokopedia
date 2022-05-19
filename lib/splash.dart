// project imports:
import 'core.dart';

class SplashScreen extends StatelessWidget {
  final String appVersion;
  const SplashScreen({Key? key, required this.appVersion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                putBoolStorage(darkModeKey, !Get.isDarkMode);
              },
              child: const Text('Change Theme'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('Version $appVersion'),
            ),
          )
        ],
      ),
    );
  }
}
