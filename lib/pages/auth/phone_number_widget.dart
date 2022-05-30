// package imports:
import 'package:flutter_lorem/flutter_lorem.dart';

// project imports:
import 'package:copy_tokopedia/core.dart';
import 'package:copy_tokopedia/widgets/appbar/plain_appbar.dart';
import 'package:copy_tokopedia/widgets/form/input_text_field.dart';

class PhoneNumberWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController inputNoHp = TextEditingController();
  PhoneNumberWidget({Key? key}) : super(key: key);

  void _next() {
    dismissTextFieldFocus(Get.overlayContext!);
    if (formKey.currentState!.validate()) {
      Get.to(
        () => OTPVerification(
          phoneNumber: inputNoHp.text,
        ),
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 500),
      )?.whenComplete(() => inputNoHp.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PlainAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  key: formKey,
                  child: InputTextField(
                    controller: inputNoHp,
                    label: "Nomor HP Kamu",
                    inputType: TextInputType.number,
                    hintText: "Contoh : 0812 3456 7890",
                    validator: Validator.validateNumber,
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
      ),
    );
  }
}
