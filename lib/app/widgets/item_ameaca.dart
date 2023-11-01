import 'package:flutter/material.dart';

import '../../theme/colors/default_colors.dart';
import '../../theme/default_theme.dart';

class ItemAmeaca extends StatelessWidget {
  const ItemAmeaca({
    Key? key,
    this.text,
    this.title,
    required this.icon,
  }) : super(key: key);

  final String? text;
  final String? title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: DefaultColors.primary[500],
            ),
            const SizedBox(width: 3),
            Text(
              title ?? "Não informado",
              style: DefaultTheme.subtitle2Medium.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 3),
          child: Text(
            text ?? "",
            style: DefaultTheme.text.copyWith(fontSize: 12),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
