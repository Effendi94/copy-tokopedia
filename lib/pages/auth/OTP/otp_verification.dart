import 'package:copy_tokopedia/core.dart';
import 'package:copy_tokopedia/widgets/appbar/plain_appbar.dart';
import 'package:copy_tokopedia/widgets/form/default_pin_input.dart';

class OTPVerification extends StatelessWidget {
  final controller = Get.put(OTPGetxController());
  final String phoneNumber;
  OTPVerification({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  void _resendCode() {
    Get.bottomSheet(
      Center(
        child: CircularProgressIndicator(
          color: MyColors.appSecondaryColors,
        ),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
      controller.resetTimer();
      controller.startTimer();
    });
  }

  void _onCompleted(String text) {
    if (text.isNotEmpty) {
      controller.verifyCode(text);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Masukkan Kode Verifikasi',
                style: TextStyle(
                  fontFamily: robotoBold,
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'Kode Verifikasi telah dikirim ke\n',
                    style: TextStyles.defaults,
                    children: <InlineSpan>[
                      TextSpan(
                        text: obfuscatePhoneNumber(phoneNumber),
                        style: TextStyles.subTitle,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Obx(
                () => Text.rich(
                  TextSpan(
                    text: 'Please enter code sent to your phone.\n',
                    style: TextStyles.defaults,
                    children: controller.timeLimit.value == 0 &&
                            !controller.isVerified.value
                        ? _buildCodeExpired
                        : _buildCodeMessage,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              DefaultPinInput(
                validator: Validator.validateNumber,
                onCompleted: _onCompleted,
              ),
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
      ),
    );
  }

  List<InlineSpan> get _buildCodeMessage {
    return <InlineSpan>[
      TextSpan(
        text: 'Code will expire in ',
        style: TextStyles.defaults,
      ),
      TextSpan(
        text: '${controller.timeLimit.value}s',
        style: TextStyle(
          fontFamily: robotoSemiBold,
          color: MyColors.info,
          decoration: TextDecoration.underline,
        ),
      ),
    ];
  }

  List<InlineSpan> get _buildCodeExpired {
    return <InlineSpan>[
      TextSpan(
        text: 'Code expired!',
        style: TextStyles.danger,
      ),
    ];
  }
}
