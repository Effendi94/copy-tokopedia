// package imports:
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_svg/flutter_svg.dart';

// project imports:
import 'package:copy_tokopedia/core.dart';

class PageViewComponent extends StatelessWidget {
  final WelcomeGetxController controller = Get.find();
  PageViewComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .7,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.selectedImage(index);
        },
        itemCount: getStartedImages.length,
        itemBuilder: (context, idx) {
          final photo = getStartedImages[idx];
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SvgPicture.asset(
                  photo,
                  height: Get.height * .5,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Text(
                  lorem(
                    paragraphs: 1,
                    words: 3,
                  ),
                  style: TextStyles.title,
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: Text(
                    lorem(
                      paragraphs: 1,
                      words: 20,
                    ),
                    style: TextStyles.defaults,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
