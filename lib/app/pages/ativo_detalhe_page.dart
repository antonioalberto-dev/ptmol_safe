import 'package:flutter/material.dart';
import 'package:ptmol/app/widgets/item_ameaca.dart';
import 'package:ptmol/theme/ui_theme.dart';

import '../../model/ativo.dart';

class AtivoDetalhe extends StatelessWidget {
  const AtivoDetalhe({Key? key, required this.ativo}) : super(key: key);

  final Ativo ativo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultColors.primary[500],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: DefaultColors.primary[500],
      body: Center(
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
            Container(
              // height: MediaQuery.of(context).size.height * 0.6,
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
                        child: Text(ativo.ativo?.toUpperCase() ?? "",
                            style: DefaultTheme.titleLarge)),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Classificação",
                          style: DefaultTheme.subtitle2Medium.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          ativo.classificacao ?? "",
                          style: DefaultTheme.text.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Card(
                      color: DefaultColors.primary[50],
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                        child: Column(
                          children: [
                            Text(
                              "Ameaças de privacidade",
                              style: DefaultTheme.subtitle2Medium.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 3),
                            ...?ativo.ameacas?.map((ameaca) {
                              if (ameaca.value != false) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.chevron_right_outlined,
                                      size: 15,
                                      color: DefaultColors.primary[500],
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      ameaca.title,
                                      style: DefaultTheme.text.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return const SizedBox(width: 0);
                            }),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (ativo.usosMaciliciosos != "")
                      ItemAmeaca(
                        icon: Icons.policy_outlined,
                        title: "Usos maliciosos",
                        text: ativo.usosMaciliciosos,
                      ),
                    Card(
                      color: DefaultColors.primary[50],
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                        child: Column(
                          children: [
                            Text(
                              "Fontes de vazamento",
                              style: DefaultTheme.subtitle2Medium.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 3),
                            ...?ativo.fontesVazamento?.map((ameaca) {
                              if (ameaca.value != false) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.chevron_right_outlined,
                                      size: 15,
                                      color: DefaultColors.primary[500],
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      ameaca.title,
                                      style: DefaultTheme.text.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return const SizedBox(width: 0);
                            }),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (ativo.alertasPrevencao != "")
                      ItemAmeaca(
                        icon: Icons.notification_important_outlined,
                        title: "Alertas de prevenção",
                        text: ativo.alertasPrevencao,
                      ),
                    if (ativo.alertasPrevencao != "")
                      ItemAmeaca(
                        icon: Icons.gpp_good_outlined,
                        title: "Contramedida",
                        text: ativo.contramedidas,
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
