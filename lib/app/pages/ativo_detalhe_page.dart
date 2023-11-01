import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ptmol/app/pages/form_page.dart';
import 'package:ptmol/app/widgets/item_ameaca.dart';
import 'package:ptmol/theme/ui_theme.dart';

import '../../model/ativo.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:share_plus/share_plus.dart';

class AtivoDetalhe extends StatefulWidget {
  const AtivoDetalhe({Key? key, required this.ativo}) : super(key: key);

  final Ativo ativo;

  @override
  State<AtivoDetalhe> createState() => _AtivoDetalheState();
}

class _AtivoDetalheState extends State<AtivoDetalhe> {
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
                        child: Text(widget.ativo.ativo?.toUpperCase() ?? "",
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
                          widget.ativo.classificacao ?? "",
                          style: DefaultTheme.text.copyWith(fontSize: 13),
                        ),
                      ],
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
                            ...?widget.ativo.ameacas?.map((ameaca) {
                              if (ameaca.value != false) {
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
                              }
                              return const SizedBox(width: 0);
                            }),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (widget.ativo.usosMaciliciosos != "")
                      ItemAmeaca(
                        icon: Icons.policy_outlined,
                        title: "Usos maliciosos",
                        text: widget.ativo.usosMaciliciosos,
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
                                    widget.ativo.risco?.probabilidade ?? "",
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
                                    widget.ativo.risco?.gravidade ?? "",
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
                            ...?widget.ativo.fontesVazamento?.map((fonte) {
                              if (fonte.value != false) {
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
                              }
                              return const SizedBox(width: 0);
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (widget.ativo.alertasPrevencao != "")
                      ItemAmeaca(
                        icon: Icons.notification_important_outlined,
                        title: "Alertas de prevenção",
                        text: widget.ativo.alertasPrevencao,
                      ),
                    if (widget.ativo.alertasPrevencao != "")
                      ItemAmeaca(
                        icon: Icons.gpp_good_outlined,
                        title: "Contramedida",
                        text: widget.ativo.contramedidas,
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(
                top: 15,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const FormularioPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.white;
                          }
                          return Colors.white;
                        },
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
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
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.picture_as_pdf_outlined,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Exportar dados",
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
  }
}
