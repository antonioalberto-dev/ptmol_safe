import 'package:flutter_modular/flutter_modular.dart';
import 'package:ptmol/src/modules/details/ui/details_page.dart';

class DetailsModule extends Module {
  @override
  void binds(i) {}

  @override
  routes(r) {
    r.child('/', child: (_) => const DetailsPage());
  }
}
