import 'package:flutter_modular/flutter_modular.dart';
import 'package:ptmol/main.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => const MyApp());
  }
}