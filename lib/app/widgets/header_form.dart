import 'package:flutter/material.dart';

import '../../theme/default_theme.dart';

class HeaderForm extends StatelessWidget {
  const HeaderForm({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title?.toUpperCase() ?? "",
            style: DefaultTheme.titleLarge,
          ),
        Text(
          subtitle ?? "",
          style: DefaultTheme.subtitleMedium,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
