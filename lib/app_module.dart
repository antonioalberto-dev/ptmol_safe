import 'package:flutter_modular/flutter_modular.dart';
import 'package:ptmol/src/modules/details/details_module.dart';
import 'package:ptmol/src/modules/form/form_module.dart';
import 'package:ptmol/src/modules/onboading/onboarding_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  routes(r) {
    r.module('/', module: OnboardingModule());
    r.module('/onboarding', module: OnboardingModule());
    r.module('/form', module: FormModule());
    r.module('/details', module: DetailsModule());
  }
}