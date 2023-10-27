import 'package:flutter/material.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

import '../../model/checkbox_model.dart';
import '../../theme/default_theme.dart';
import '../widgets/header_form.dart';
import '../widgets/item_formulario.dart';
import '../widgets/ptmol_button.dart';
import '../widgets/ptmol_text_field.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FormularioPage> {
  final listFontesVazamento = [
    CheckboxModel(title: "Membro malicioso"),
    CheckboxModel(title: "Provedor de serviço"),
    CheckboxModel(title: "Aplicativo terceirizado"),
    CheckboxModel(title: "Fontes externas"),
  ];
  final listAmeacas = [
    CheckboxModel(title: "Cyberstalking"),
    CheckboxModel(title: "Divulgação de Informação"),
    CheckboxModel(title: "Ameaça a reputação"),
    CheckboxModel(title: "Rastreamento e Inferência de Dados"),
    CheckboxModel(title: "Clonagem de perfil"),
    CheckboxModel(title: "Roubo de identidade"),
    CheckboxModel(title: "Reconhecimento facial"),
    CheckboxModel(title: "Espionagem"),
    CheckboxModel(title: "Gravação não autorizada"),
  ];
  final dropValueClassificacao = ValueNotifier('');
  final dropOpcoesClassificacao = [
    "Textual",
    "Multimídia",
    "Geográfico",
    "Dado de uso",
    "Dado de relacionamento",
  ];
  final dropValueProbabilidade = ValueNotifier('');
  final dropValueGravidade = ValueNotifier('');
  final dropValueRiscos = ["Alta", "Média", "Baixa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Drawer(),
      appBar: AppBar(),
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
                subtitle: "Identifique os ativos, as ameaças e as contramedidas",
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ItemFormulario(
                        labelText: "Informe o ativo",
                        item: PtmolTextField(
                          hintText: "O que deve ser protegido?",
                          maxLines: 1,
                        ),
                      ),
                      ItemFormulario(
                        labelText: "Classificação",
                        item: ValueListenableBuilder(
                            valueListenable: dropValueClassificacao,
                            builder: (BuildContext context, String value, _) {
                              return DropdownButtonFormField(
                                decoration: InputDecoration(
                                  hintStyle: DefaultTheme.hintStyle,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 8.0,
                                  ),
                                ),
                                hint: Text("Selecione",
                                    style: DefaultTheme.hintStyle),
                                value: (value.isEmpty) ? null : value,
                                onChanged: (escolha) => dropValueClassificacao
                                    .value = escolha.toString(),
                                items: dropOpcoesClassificacao
                                    .map((opcao) => DropdownMenuItem(
                                          value: opcao,
                                          child: Text(
                                            opcao,
                                            style: DefaultTheme.text.copyWith(
                                              color: DefaultColors.primary[500],
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
                            ...listAmeacas.map(
                              (item) => CheckboxListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                controlAffinity: ListTileControlAffinity.leading,
                                checkboxShape: const CircleBorder(),
                                value: item.value,
                                activeColor: DefaultColors.primary[500],
                                onChanged: (value) => onClicked(item),
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
                            ...listFontesVazamento.map(
                              (item) => CheckboxListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                controlAffinity: ListTileControlAffinity.leading,
                                checkboxShape: const CircleBorder(),
                                value: item.value,
                                activeColor: DefaultColors.primary[500],
                                onChanged: (value) => onClicked(item),
                                title: Text(
                                  item.title,
                                  style: DefaultTheme.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ItemFormulario(
                        labelText: "Usos maliciosos",
                        item: PtmolTextField(
                          hintText:
                              "O que pode afetar a privacidade do usuário? ",
                          maxLines: 3,
                        ),
                      ),
                      ItemFormulario(
                        labelText: "Riscos",
                        item: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: dropValueProbabilidade,
                              builder: (BuildContext context, String value, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Probabilidade",
                                      style: DefaultTheme.headerInput.copyWith(
                                          fontSize: 12,
                                          color: DefaultColors.primary[500]),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
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
                                        value: (value.isEmpty) ? null : value,
                                        onChanged: (escolha) =>
                                            dropValueProbabilidade.value =
                                                escolha.toString(),
                                        items: dropValueRiscos
                                            .map((opcao) => DropdownMenuItem(
                                                  value: opcao,
                                                  child: Text(
                                                    opcao,
                                                    style: DefaultTheme.text
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
                              valueListenable: dropValueGravidade,
                              builder: (BuildContext context, String value, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gravidade",
                                      style: DefaultTheme.headerInput.copyWith(
                                          fontSize: 12,
                                          color: DefaultColors.primary[500]),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
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
                                        value: (value.isEmpty) ? null : value,
                                        onChanged: (escolha) => dropValueGravidade
                                            .value = escolha.toString(),
                                        items: dropValueRiscos
                                            .map((opcao) => DropdownMenuItem(
                                                  value: opcao,
                                                  child: Text(
                                                    opcao,
                                                    style: DefaultTheme.text
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
                      const ItemFormulario(
                        labelText: "Alertas de prevenção",
                        item: PtmolTextField(
                          hintText:
                              "Que alerta poderia ser emitido para informar o usuário sobre consequências para a sua privacidade?",
                          maxLines: 3,
                        ),
                      ),
                      const ItemFormulario(
                        labelText: "Contramedidas",
                        item: PtmolTextField(
                          hintText:
                              "Qual estratégia adotar para mitigar as ameaças?",
                          maxLines: 3,
                        ),
                      ),
                      PtmolButton(
                        function: () {},
                        label: "Exportar dados",
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  onClicked(CheckboxModel ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value!;
    });
  }
}
