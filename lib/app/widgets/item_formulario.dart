import 'package:flutter/material.dart';

import '../../theme/default_theme.dart';

class ItemFormulario extends StatelessWidget {
  const ItemFormulario({
    super.key,
    required this.labelText,
    required this.item,
  });

  final String labelText;
  final Widget item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: DefaultTheme.headerInput,
        ),
        const SizedBox(height: 10),
        item,
        const SizedBox(height: 20),
      ],
    );
  }
}
