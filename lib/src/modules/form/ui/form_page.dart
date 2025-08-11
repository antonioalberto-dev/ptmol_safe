import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:ptmol/src/modules/details/viewmodel/details_viewmodel.dart';
import 'package:ptmol/src/modules/form/viewmodel/form_viewmodel.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

import '../../../../theme/default_theme.dart';
import 'widgets/header_form.dart';
import 'widgets/item_formulario.dart';
import 'widgets/ptmol_text_field.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormViewmodel>(
      init: FormViewmodel(),
      builder: (viewModel) {
        var widthRisk = MediaQuery.of(context).size.width * 0.42;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderForm(
                    title: "Modelagem de ameaças",
                    subtitle:
                        "Identifique os ativos, as ameaças e as contramedidas",
                  ),
                  Form(
                    key: viewModel.formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ItemFormulario(
                            labelText: "Informe o ativo",
                            item: PtmolTextField(
                              hintText: "O que deve ser protegido?",
                              maxLines: 1,
                              controller: viewModel.ativoController,
                            ),
                          ),
                          ItemFormulario(
                            labelText: "Classificação",
                            item: ValueListenableBuilder(
                                valueListenable:
                                    viewModel.dropValueClassificacao,
                                builder:
                                    (BuildContext context, String value, _) {
                                  return DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      hintStyle: DefaultTheme.hintStyle,
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                    ),
                                    hint: Text("Selecione",
                                        style: DefaultTheme.hintStyle),
                                    value: (value.isEmpty) ? null : value,
                                    onChanged: (escolha) {
                                      viewModel.setClassificacao(escolha);
                                    },
                                    items: viewModel.dropOpcoesClassificacao
                                        .map((opcao) => DropdownMenuItem(
                                              value: opcao,
                                              child: Text(
                                                opcao,
                                                style:
                                                    DefaultTheme.text.copyWith(
                                                  color: DefaultColors
                                                      .primary[500],
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  );
                                }),
                          ),
                          ItemFormulario(
                            labelText: "Selecione as ameaças",
                            item: Column(
                              children: [
                                ...viewModel.listAmeacas.map(
                                  (item) => CheckboxListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    checkboxShape: const CircleBorder(),
                                    value: item.value,
                                    activeColor: DefaultColors.primary[500],
                                    onChanged: (value) =>
                                        viewModel.onCheckboxClicked(item),
                                    title: Text(
                                      item.title,
                                      style: DefaultTheme.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ItemFormulario(
                            labelText: "Fonte de vazamento",
                            item: Column(
                              children: [
                                ...viewModel.listFontesVazamento.map(
                                  (item) => CheckboxListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    checkboxShape: const CircleBorder(),
                                    value: item.value,
                                    activeColor: DefaultColors.primary[500],
                                    onChanged: (value) =>
                                        viewModel.onCheckboxClicked(item),
                                    title: Text(
                                      item.title,
                                      style: DefaultTheme.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ItemFormulario(
                            labelText: "Usos maliciosos",
                            item: PtmolTextField(
                              hintText:
                                  "O que pode afetar a privacidade do usuário? ",
                              maxLines: 3,
                              controller: viewModel.usosMaliciososController,
                            ),
                          ),
                          ItemFormulario(
                            labelText: "Riscos",
                            item: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable:
                                      viewModel.dropValueProbabilidade,
                                  builder:
                                      (BuildContext context, String value, _) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Probabilidade",
                                          style: DefaultTheme.headerInput
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: DefaultColors
                                                      .primary[500]),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: widthRisk,
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              hintStyle: DefaultTheme.hintStyle,
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                                vertical: 8.0,
                                              ),
                                            ),
                                            hint: Text("Selecione",
                                                style: DefaultTheme.hintStyle),
                                            value:
                                                (value.isEmpty) ? null : value,
                                            onChanged: (escolha) {
                                              viewModel
                                                  .setProbabilidade(escolha);
                                            },
                                            items: viewModel.dropValueRiscos
                                                .map(
                                                    (opcao) => DropdownMenuItem(
                                                          value: opcao,
                                                          child: Text(
                                                            opcao,
                                                            style: DefaultTheme
                                                                .text
                                                                .copyWith(
                                                              color: DefaultColors
                                                                  .primary[500],
                                                            ),
                                                          ),
                                                        ))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                ValueListenableBuilder(
                                  valueListenable: viewModel.dropValueGravidade,
                                  builder:
                                      (BuildContext context, String value, _) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Gravidade",
                                          style: DefaultTheme.headerInput
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: DefaultColors
                                                      .primary[500]),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: widthRisk,
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              hintStyle: DefaultTheme.hintStyle,
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                                vertical: 8.0,
                                              ),
                                            ),
                                            hint: Text("Selecione",
                                                style: DefaultTheme.hintStyle),
                                            value:
                                                (value.isEmpty) ? null : value,
                                            onChanged: (escolha) {
                                              viewModel.setGravidade(escolha);
                                            },
                                            items: viewModel.dropValueRiscos
                                                .map(
                                                    (opcao) => DropdownMenuItem(
                                                          value: opcao,
                                                          child: Text(
                                                            opcao,
                                                            style: DefaultTheme
                                                                .text
                                                                .copyWith(
                                                              color: DefaultColors
                                                                  .primary[500],
                                                            ),
                                                          ),
                                                        ))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          ItemFormulario(
                            labelText: "Alertas de prevenção",
                            item: PtmolTextField(
                              hintText:
                                  "Que alerta poderia ser emitido para informar o usuário sobre consequências para a sua privacidade?",
                              maxLines: 3,
                              controller: viewModel.alertasController,
                            ),
                          ),
                          ItemFormulario(
                            labelText: "Contramedidas",
                            item: PtmolTextField(
                              hintText:
                                  "Qual estratégia adotar para mitigar as ameaças?",
                              maxLines: 3,
                              controller: viewModel.contramedidasController,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (viewModel.validateForm()) {
                                // Obter ou criar instância do DetailsViewmodel
                                final detailsViewModel =
                                    Get.put(DetailsViewmodel());

                                // Passar os dados do formulário para o DetailsViewmodel
                                detailsViewModel
                                    .setAtivo(viewModel.getAtivoFromForm());

                                Modular.to.pushNamed('/details/');
                              }
                            },
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
                              "Finalizar inspeção",
                              style: DefaultTheme.button,
                            )),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
