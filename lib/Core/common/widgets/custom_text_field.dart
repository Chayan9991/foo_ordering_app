import 'package:cafe_menu_app_new/Core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _hintText;
  final TextEditingController _textController;
  final Widget _prefixIcon;
  final Widget _suffixIcon;

  const CustomTextField(
      {super.key,
      required String hintText,
      required Widget prefixIcon,
      required Widget suffixIcon,
      required TextEditingController textController})
      : _hintText = hintText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _textController = textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
          hintText: _hintText,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.grey.shade500),
          prefixIcon: _prefixIcon,
          suffixIcon: _suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none)),
    );
  }
}
