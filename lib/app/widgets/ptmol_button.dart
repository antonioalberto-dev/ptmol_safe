import 'package:flutter/material.dart';
import 'package:ptmol/theme/default_theme.dart';

import '../../theme/colors/default_colors.dart';

class PtmolButton extends StatelessWidget {
  const PtmolButton({
    super.key,
    this.function,
    required this.label,
  });

  final Function? function;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return Colors.white;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return DefaultColors.success;
              }
              return DefaultColors.success;
            },
          ),
        ),
        onPressed: function?.call(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.picture_as_pdf_outlined),
            const SizedBox(width: 10),
            Text(label, style: DefaultTheme.button),
          ],
        ),
      ),
    );
  }
}
