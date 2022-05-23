import 'package:copy_tokopedia/core.dart';
import 'package:copy_tokopedia/widgets/form/default_pin_input.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  void _resendCode() {}

  @override
  Widget build(BuildContext context) {
    var second = 25;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(
                  Icons.close_rounded,
                  color: MyColors.black,
                ),
              ),
            ),
            const Text(
              'Input Code',
              style: TextStyle(
                fontFamily: robotoBold,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text.rich(
                TextSpan(
                  text:
                      'Please enter code sent to your phone, Code will expire in ',
                  style: TextStyles.defaults,
                  children: <InlineSpan>[
                    TextSpan(
                      text: '${second}s',
                      style: TextStyle(
                        fontFamily: robotoSemiBold,
                        color: MyColors.info,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const DefaultPinInput(),
            Text(
              "Didn't receive code?",
              style: TextStyles.defaults,
            ),
            TextButton(
              onPressed: _resendCode,
              child: Text(
                'Resend',
                style: TextStyle(
                  fontFamily: robotoMedium,
                  color: MyColors.info,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
