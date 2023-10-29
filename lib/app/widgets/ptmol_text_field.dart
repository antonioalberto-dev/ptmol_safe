import 'package:flutter/material.dart';

import '../../theme/default_theme.dart';

class PtmolTextField extends StatelessWidget {
  const PtmolTextField({
    super.key,
    required this.hintText,
    required this.maxLines,
    this.controller,
  });

  final int maxLines;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: DefaultTheme.hintStyle,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
      ),
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
    );
  }
}
