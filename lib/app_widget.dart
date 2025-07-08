import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PTMOL Safe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: DefaultColors.primary,
          primary: DefaultColors.primary[500],
        ),
        useMaterial3: true,
        unselectedWidgetColor: DefaultColors.primary[500],
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
