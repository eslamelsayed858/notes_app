import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.hintmaxLines,
      this.onSaved,
      this.onChanged});

  final String hint;
  final int hintmaxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is requird';
        } else {
          return null;
        }
      },
      cursorColor: KPrimaryColor,
      maxLines: hintmaxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: KPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(KPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
      borderSide: BorderSide(
        color: Color ?? Colors.white,
      ),
    );
  }
}
