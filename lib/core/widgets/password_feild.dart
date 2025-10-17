import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_feild.dart';

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      obscureText: obscureText,
      onSaved: (value) {
        widget.onSaved!(value);
      },
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: obscureText
            ? Icon(Icons.visibility_off, color: Color(0xFFC9CECF))
            : Icon(Icons.remove_red_eye, color: Color(0xFFC9CECF)),
      ),
    );
  }
}
