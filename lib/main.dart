import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ptmol/app/pages/onboading_page.dart';
import 'package:ptmol/app_module.dart';
import 'package:ptmol/app_widget.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
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
