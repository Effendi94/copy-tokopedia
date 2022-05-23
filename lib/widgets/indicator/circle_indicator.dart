import 'package:copy_tokopedia/core.dart';

class CircleIndicatorWidget extends StatelessWidget {
  final int dataLength;
  final int currentImage;
  final ValueBuilderUpdateCallback<int>? updateFn;
  final Color defaultColor;
  const CircleIndicatorWidget({
    Key? key,
    required this.dataLength,
    required this.currentImage,
    this.updateFn,
    this.defaultColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dataLength,
        (index) => _buildIndicator(
            index, dataLength, currentImage, index == currentImage),
      ),
    );
  }

  Widget _buildIndicator(
      int index, int dataLength, int currentImage, bool isActive) {
    const double normalSize = 6;
    const double activeSize = normalSize * 1.5;
    double size = normalSize;
    if (isActive) size = activeSize;
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: isActive ? MyColors.appSecondaryColors : defaultColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
