import 'package:flutter_modular/flutter_modular.dart';
import 'package:ptmol/src/modules/onboading/ui/onboading_page.dart';

class OnboardingModule extends Module {
  @override
  void binds(i) {}

  @override
  routes(r) {
    r.child('/', child: (_) => const OnboardingPage());
  }
}
