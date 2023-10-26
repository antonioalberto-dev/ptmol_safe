import 'package:flutter/material.dart';

import '../../theme/default_theme.dart';

class PtmolTextField extends StatelessWidget {
  const PtmolTextField({
    super.key,
    required this.hintText,
    required this.maxLines,
  });

  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
