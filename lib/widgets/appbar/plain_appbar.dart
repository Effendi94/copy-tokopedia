import 'package:copy_tokopedia/core.dart';

class PlainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const PlainAppBar({
    Key? key,
    this.title,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      foregroundColor: MyColors.black,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.close_rounded,
            color: MyColors.black,
            size: 24,
          ),
        ),
      ),
      title: title != null
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title!,
                style: TextStyles.title,
              ),
            )
          : null,
      centerTitle: true,
    );
  }
}
