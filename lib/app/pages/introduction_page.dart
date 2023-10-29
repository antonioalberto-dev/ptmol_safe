import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ptmol/app/pages/ativo_detalhe_page.dart';
import 'package:ptmol/app/pages/formulario_page.dart';
import 'package:ptmol/theme/default_theme.dart';
import 'package:ptmol/theme/ui_theme.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: SvgPicture.asset(
          "assets/illustrations/1.svg",
        ),
        title: "Bem-vindo(a) a PTMOL",
        body: "Sua aliada na prevenção de ameaças em redes sociais!",
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset(
          "assets/illustrations/2.svg",
        ),
        title: "Ativos - Entendendo o Básico",
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ativos são atributos pessoais relacionados ao usuário. E podem ser classificados em:",
              style: DefaultTheme.textOnboarding,
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " - Ativos de usuário: Textuais, multimídia, geográficos.",
                    style: DefaultTheme.textOnboarding,
                  ),
                  Text(
                    " - Ativos de sistema: Dados de uso ou relacionamento",
                    style: DefaultTheme.textOnboarding.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset("assets/illustrations/3.svg"),
        title: "Ameaças - Protegendo seus Ativos",
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ameaças são eventos indesejados que podem colocar seus ativos em risco.",
              style: DefaultTheme.textOnboarding,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Consulte nosso catálogo de ameaças no app para análise detalhada.",
              style: DefaultTheme.textOnboarding,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset("assets/illustrations/4.svg"),
        title: "Fontes de Vazamento\nIdentificando Riscos",
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quatro tipos de fontes de vazamento:",
              style: DefaultTheme.textOnboarding,
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " - FV1: Membro malicioso",
                    style: DefaultTheme.textOnboarding,
                  ),
                  Text(
                    " - FV2: Provedor de serviço",
                    style: DefaultTheme.textOnboarding.copyWith(),
                  ),
                  Text(
                    " - FV3: Aplicativo terceirizado",
                    style: DefaultTheme.textOnboarding,
                  ),
                  Text(
                    " - FV4: Fontes externas",
                    style: DefaultTheme.textOnboarding.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset("assets/illustrations/5.svg"),
        title: "Usos Maliciosos\nPrevenção é a Chave",
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Usos maliciosos descrevem comportamentos prejudiciais à privacidade do usuário.",
              style: DefaultTheme.textOnboarding,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset("assets/illustrations/6.svg"),
        title: "Riscos\nAvaliando a Probabilidade e Gravidade",
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Riscos são classificados em probabilidade e gravidade. Podendo ter valores variando entre alta, média e baixa.",
              style: DefaultTheme.textOnboarding,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset("assets/illustrations/7.svg"),
        title: "Alertas de Prevenção - Fique Atento",
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alertas informam sobre ações que podem violar sua privacidade de forma significativa",
              style: DefaultTheme.textOnboarding,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 18),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset("assets/illustrations/8.svg"),
        title: "Contramedidas - Protegendo seus Ativos",
        body:
            "Contramedidas são ações do sistema para mitigar ameaças de privacidade das fontes de vazamento.",
        decoration: PageDecoration(
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium,
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 18),
        ),
      ),
      PageViewModel(
        image: SvgPicture.asset("assets/illustrations/9.svg"),
        title:
            "Pronto para explorar a PTMOL e proteger sua privacidade nas redes sociais?",
        body: "Comece sua jornada agora e mantenha seus ativos seguros!",
        decoration: PageDecoration(
          bodyAlignment: Alignment.center,
          bodyTextStyle: DefaultTheme.textOnboarding,
          titleTextStyle: DefaultTheme.subtitle2Medium.copyWith(
            fontSize: 20,
          ),
          imagePadding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
          bodyPadding: const EdgeInsets.symmetric(horizontal: 18),
          titlePadding: const EdgeInsets.all(16),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: getPages(),
        onDone: () => Navigator.push(
          context,
          PageTransition(
            child: const FormularioPage(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 1000),
          ),
        ),
        nextFlex: 2,
        dotsFlex: 6,
        skipOrBackFlex: 2,
        onSkip: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const FormularioPage(),
          ),
        ),
        showBackButton: false,
        showSkipButton: true,
        skip: Text("Pular", style: DefaultTheme.subtitleMedium),
        showDoneButton: true,
        done: const Icon(Icons.chevron_right_outlined, size: 30),
        showNextButton: true,
        next: const Icon(Icons.chevron_right_outlined, size: 30),
      ),
    );
  }
}
