// package imports:
import 'package:pinput/pinput.dart';

// project imports:
import 'package:copy_tokopedia/core.dart';

class DefaultPinInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String)? onCompleted;
  final Function(String)? onSubmitted;
  const DefaultPinInput({
    Key? key,
    required this.validator,
    this.onCompleted,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: MyColors.primary,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: MyColors.info,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: MyColors.grey,
      ),
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          length: 6,
          validator: validator,
          errorBuilder: _errorBuilder,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          // onCompleted: onCompleted,
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }

  Widget _errorBuilder(String? text, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        text ?? '',
        style: TextStyles.inputError,
      ),
    );
  }
}
