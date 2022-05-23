import 'package:copy_tokopedia/core.dart';
import 'package:copy_tokopedia/pages/auth/verification_page.dart';
import 'package:copy_tokopedia/widgets/form/input_text_field_with_label.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class PhoneNumberWidget extends StatelessWidget {
  final WelcomeGetxController controller = Get.find();
  final TextEditingController inputNoHp = TextEditingController();
  PhoneNumberWidget({Key? key}) : super(key: key);

  void _next() {
    Get.back();
    Get.bottomSheet(
      const VerificationCodePage(),
      isScrollControlled: true,
      backgroundColor: MyColors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: Get.back,
              icon: Icon(
                Icons.close_rounded,
                color: MyColors.black,
              ),
            ),
            Text(
              lorem(paragraphs: 1, words: 3),
              style: TextStyles.title,
            ),
            const SizedBox(height: 10),
            Text(
              lorem(paragraphs: 1, words: 8),
              style: TextStyles.defaults,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Form(
                child: InputTextFieldWithLabel(
                  controller: inputNoHp,
                  label: "Nomor HP Kamu",
                  inputType: TextInputType.number,
                  hintText: "Contoh : 0812 3456 7890",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _next,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Lanjut',
                style: TextStyles.elevatedButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
