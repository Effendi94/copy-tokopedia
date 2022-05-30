import 'package:copy_tokopedia/core.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final int? maxLength;
  const InputTextField({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    required this.label,
    this.hintText,
    this.validator,
    this.maxLength,
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
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          validator: validator,
          maxLength: maxLength,
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
