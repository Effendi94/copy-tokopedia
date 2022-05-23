// project imports:
import 'package:copy_tokopedia/core.dart';
import 'package:copy_tokopedia/widgets/indicator/circle_indicator.dart';

import 'xcore.dart';

class GetStartedWidget extends StatelessWidget {
  final WelcomeGetxController controller = Get.find();
  final Function() goToStart;
  final List<String> listImages;
  GetStartedWidget({
    Key? key,
    required this.listImages,
    required this.goToStart,
  }) : super(key: key);

  void _next() {
    controller.pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          PageViewComponent(),
          Obx(
            () => CircleIndicatorWidget(
              dataLength: listImages.length,
              currentImage: controller.selectedImage.value,
            ),
          ),
          Flexible(
            child: _buildButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Obx(
      () => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: listImages.length == controller.selectedImage.value + 1
                ? goToStart
                : _next,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50), // NEW
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              listImages.length == controller.selectedImage.value + 1
                  ? 'Get Started'
                  : 'Next',
              style: TextStyles.elevatedButton,
            ),
          ),
        ),
      ),
    );
  }
}
