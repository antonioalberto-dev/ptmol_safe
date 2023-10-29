import 'package:flutter/material.dart';
import 'package:ptmol/app/pages/introduction_page.dart';
import 'package:ptmol/theme/colors/default_colors.dart';
import 'package:ptmol/theme/default_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PTMOL Safe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: DefaultColors.primary,
          primary: DefaultColors.primary[500],
        ),
        useMaterial3: true,
        unselectedWidgetColor: DefaultColors.primary[500],
      ),
      home: const IntroductionPage(),
    );
  }
}
