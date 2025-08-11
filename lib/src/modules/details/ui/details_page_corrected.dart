import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:ptmol/src/modules/details/ui/widgets/item_ameaca.dart';
import 'package:ptmol/src/modules/details/viewmodel/details_viewmodel.dart';
import 'package:ptmol/theme/ui_theme.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey repaintBoundaryKey = GlobalKey();
    
    return GetBuilder<DetailsViewmodel>(
      init: DetailsViewmodel(),
      builder: (viewModel) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: DefaultColors.primary[500],
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          backgroundColor: DefaultColors.primary[500],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Inspeção finalizada!",
                  style: DefaultTheme.textOnboarding.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "MODELO DE AMEAÇAS",
                  style: DefaultTheme.titleLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                RepaintBoundary(
                  key: repaintBoundaryKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text(viewModel.nomeAtivo.toUpperCase(),
                                  style: DefaultTheme.titleLarge)),
                          const SizedBox(height: 15),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Classificação",
                                  style: DefaultTheme.subtitle2Medium.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  viewModel.classificacao,
                                  style: DefaultTheme.text.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Card(
                            color: DefaultColors.primary[50],
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 7),
                              child: Column(
                                children: [
                                  Text(
                                    "Ameaças de privacidade",
                                    style: DefaultTheme.subtitle2Medium.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  ...viewModel.ameacasSelecionadas.map((ameaca) {
                                    return Row(
                                      children: [
                                        Icon(
                                          Icons.chevron_right_outlined,
                                          size: 15,
                                          color: DefaultColors.primary[500],
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          ameaca.title,
                                          style: DefaultTheme.text.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (viewModel.hasUsosMaliciosos)
                            ItemAmeaca(
                              icon: Icons.policy_outlined,
                              title: "Usos maliciosos",
                              text: viewModel.usosMaliciosos,
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    size: 17,
                                    color: DefaultColors.primary[500],
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    "Risco",
                                    style: DefaultTheme.subtitle2Medium.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Probabilidade",
                                          style:
                                              DefaultTheme.subtitle2Medium.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          viewModel.probabilidade,
                                          style: DefaultTheme.text.copyWith(
                                            fontSize: 12,
                                            color: DefaultColors.primary[500],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Gravidade",
                                          style:
                                              DefaultTheme.subtitle2Medium.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          viewModel.gravidade,
                                          style: DefaultTheme.text.copyWith(
                                            fontSize: 12,
                                            color: DefaultColors.primary[500],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Card(
                            color: DefaultColors.primary[50],
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 7),
                              child: Column(
                                children: [
                                  Text(
                                    "Fontes de vazamento",
                                    style: DefaultTheme.subtitle2Medium.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  ...viewModel.fontesSelecionadas.map((fonte) {
                                    return Row(
                                      children: [
                                        Icon(
                                          Icons.chevron_right_outlined,
                                          size: 15,
                                          color: DefaultColors.primary[500],
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          fonte.title,
                                          style: DefaultTheme.text.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (viewModel.hasAlertasPrevencao)
                            ItemAmeaca(
                              icon: Icons.notification_important_outlined,
                              title: "Alertas de prevenção",
                              text: viewModel.alertasPrevencao,
                            ),
                          if (viewModel.hasContramedidas)
                            ItemAmeaca(
                              icon: Icons.gpp_good_outlined,
                              title: "Contramedida",
                              text: viewModel.contramedidas,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(
                    top: 15,
                    bottom: 40,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => Modular.to.pushNamed('/form/'),
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors.white;
                              }
                              return Colors.white;
                            },
                          ),
                          backgroundColor: WidgetStateProperty.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.pressed)) {
                                return DefaultColors.success;
                              }
                              return DefaultColors.success;
                            },
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Iniciar nova inspeção",
                            style: DefaultTheme.subtitleMedium.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => viewModel.exportAsImage(repaintBoundaryKey),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.image_outlined,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Exportar como imagem",
                                style: DefaultTheme.subtitleMedium.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
