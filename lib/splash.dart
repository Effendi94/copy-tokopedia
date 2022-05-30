// project imports:
import 'core.dart';

class SplashScreen extends StatefulWidget {
  final String appVersion;

  const SplashScreen({Key? key, required this.appVersion}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> tweenOne = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeIn,
  );

  late final Animation<Offset> tweenTwo =
      Tween<Offset>(begin: const Offset(0.0, 4.0), end: const Offset(0.0, 0.0))
          .animate(
    CurvedAnimation(parent: tweenOne, curve: Curves.bounceOut),
  );

  late final Animation<double> tweenThree =
      Tween(begin: 0.0, end: 1.0).animate(tweenOne);

  @override
  void initState() {
    super.initState();
    initScreen();
  }

  void initScreen() async {
    await animationController.forward().whenComplete(
      () {
        Get.offAndToNamed(welcomeScreen);
        // Get.offAll(
        //   () => WelcomeScreen(),
        //   transition: Transition.zoom,
        //   duration: const Duration(milliseconds: 1000),
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       colors: [tes, MyColors.white],
        //       begin: const FractionalOffset(0.2, 0.5),
        //       end: const FractionalOffset(0.1, 1.3),
        //       stops: const [0.0, 1.0],
        //       tileMode: TileMode.clamp),
        // ),
        width: double.infinity,
        height: Get.height,
        child: Stack(
          children: [
            SizedBox(
              child: FadeTransition(
                opacity: tweenOne,
                child: Image.asset(
                  Get.isDarkMode ? logoDarkNoText : logoLightNoText,
                  width: double.infinity,
                  height: Get.height,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: FadeTransition(
                        opacity: tweenOne,
                        child: const Text(
                          'ShopBag',
                          style: TextStyle(
                            fontFamily: robotoBold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: SlideTransition(
                        position: tweenTwo,
                        child: FadeTransition(
                          opacity: tweenThree,
                          child: const Text(
                            'Online Shopping',
                            style: TextStyle(
                              fontFamily: robotoLight,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text('Version ${widget.appVersion}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
