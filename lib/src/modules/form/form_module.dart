import 'package:flutter_modular/flutter_modular.dart';
import 'package:ptmol/src/modules/form/ui/form_page.dart';

class FormModule extends Module {
  @override
  void binds(i) {}

  @override
  routes(r) {
    r.child('/', child: (_) => const FormPage());
  }
}
