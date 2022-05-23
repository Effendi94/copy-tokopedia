import 'package:copy_tokopedia/core.dart';

class InputTextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final String? hintText;
  const InputTextFieldWithLabel({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    required this.label,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.inputLabel,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.inputHint,
            border: InputStyles.borderDefault,
            focusedBorder: InputStyles.borderActive,
          ),
        ),
      ],
    );
  }
}
