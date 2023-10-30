import 'package:flutter/material.dart';
import 'package:ptmol/app/pages/ativo_detalhe_page.dart';
import 'package:ptmol/app/pages/introduction_page.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

import '../../model/ativo.dart';
import '../../model/checkbox_model.dart';
import '../../theme/default_theme.dart';
import '../widgets/header_form.dart';
import '../widgets/item_formulario.dart';
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
    "Dados de uso",
    "Dados de relacionamento",
  ];
  final dropValueProbabilidade = ValueNotifier('');
  final dropValueGravidade = ValueNotifier('');
  final dropValueRiscos = ["Alta", "Média", "Baixa"];

  List<String> ameacas = [];

  TextEditingController ativoController = TextEditingController();
  String? classificao;
  TextEditingController usosMaliciososController = TextEditingController();
  String? gravidade;
  String? probabilidade;
  TextEditingController alertasController = TextEditingController();
  TextEditingController contramedidasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var widthRisk = MediaQuery.of(context).size.width * 0.42;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: DefaultColors.primary[500],
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset("assets/ptmol.png", height: 100),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    color: Colors.grey.shade300),
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const FormularioPage()),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.home_outlined),
                        const SizedBox(width: 10),
                        Text(
                          "Inicio",
                          style: DefaultTheme.headerInput,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    color: Colors.grey.shade300),
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const IntroductionPage()),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.library_books_outlined),
                        const SizedBox(width: 10),
                        Text(
                          "Conheça a PTMOL",
                          style: DefaultTheme.headerInput,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
                subtitle:
                    "Identifique os ativos, as ameaças e as contramedidas",
              ),
              Form(
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
                          controller: ativoController,
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
                                onChanged: (escolha) {
                                  dropValueClassificacao.value =
                                      escolha.toString();
                                  classificao = escolha.toString();
                                },
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
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                        labelText: "Usos maliciosos",
                        item: PtmolTextField(
                          hintText:
                              "O que pode afetar a privacidade do usuário? ",
                          maxLines: 3,
                          controller: usosMaliciososController,
                        ),
                      ),
                      ItemFormulario(
                        labelText: "Riscos",
                        item: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        value: (value.isEmpty) ? null : value,
                                        onChanged: (escolha) {
                                          dropValueProbabilidade.value =
                                              escolha.toString();
                                          probabilidade = escolha;
                                        },
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
                                        value: (value.isEmpty) ? null : value,
                                        onChanged: (escolha) {
                                          dropValueGravidade.value =
                                              escolha.toString();
                                          gravidade = escolha;
                                        },
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
                      ItemFormulario(
                        labelText: "Alertas de prevenção",
                        item: PtmolTextField(
                          hintText:
                              "Que alerta poderia ser emitido para informar o usuário sobre consequências para a sua privacidade?",
                          maxLines: 3,
                          controller: alertasController,
                        ),
                      ),
                      ItemFormulario(
                        labelText: "Contramedidas",
                        item: PtmolTextField(
                          hintText:
                              "Qual estratégia adotar para mitigar as ameaças?",
                          maxLines: 3,
                          controller: contramedidasController,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => AtivoDetalhe(
                                ativo: Ativo(
                                  ativo: ativoController.text,
                                  classificacao: classificao,
                                  usosMaciliciosos:
                                      usosMaliciososController.text,
                                  contramedidas: contramedidasController.text,
                                  risco: Risco(
                                      gravidade: gravidade,
                                      probabilidade: probabilidade),
                                  alertasPrevencao: alertasController.text,
                                  ameacas: listAmeacas,
                                  fontesVazamento: listFontesVazamento,
                                ),
                              ),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  onClicked(CheckboxModel ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value!;
    });
  }
}
