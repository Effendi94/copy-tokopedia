import 'package:copy_tokopedia/core.dart';
import 'package:copy_tokopedia/pages/welcome/components/xcore.dart';

class WelcomeScreen extends StatelessWidget {
  final controller = Get.put(WelcomeGetxController());
  WelcomeScreen({Key? key}) : super(key: key);

  void _goToStart() {
    debugPrint('Go to Start');
    Get.bottomSheet(
      PhoneNumberWidget(),
      backgroundColor: MyColors.white,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: WelcomeCustomShape(),
            child: Container(
              height: Get.height * .6,
              color: MyColors.appPrimaryColors,
            ),
          ),
          GetStartedWidget(
            listImages: getStartedImages,
            goToStart: _goToStart,
          ),
          Positioned(
            top: 20,
            right: 10,
            child: TextButton(
              child: Text(
                'Skip',
                style: TextStyle(
                  fontFamily: robotoSemiBold,
                  color: MyColors.appSecondaryColors,
                  fontSize: 14,
                ),
              ),
              onPressed: _goToStart,
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
