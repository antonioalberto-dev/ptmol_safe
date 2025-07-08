import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptmol/src/modules/form/data/models/checkbox_model.dart';
import 'package:ptmol/src/modules/form/data/models/ativo.dart';

class FormViewmodel extends GetxController {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final ativoController = TextEditingController();
  final usosMaliciososController = TextEditingController();
  final alertasController = TextEditingController();
  final contramedidasController = TextEditingController();

  // Dropdown values
  final dropValueClassificacao = ValueNotifier('');
  final dropValueProbabilidade = ValueNotifier('');
  final dropValueGravidade = ValueNotifier('');

  // Dropdown options
  final dropOpcoesClassificacao = [
    "Textual",
    "Multimídia",
    "Geográfico",
    "Dados de uso",
    "Dados de relacionamento",
  ];

  final dropValueRiscos = ["Alta", "Média", "Baixa"];

  // Selected values
  String? classificacao;
  String? gravidade;
  String? probabilidade;

  // Checkbox lists
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

  // Selected threats
  List<String> ameacas = [];

  // Methods
  void onCheckboxClicked(CheckboxModel ckbItem) {
    ckbItem.value = !ckbItem.value;
    update();
  }

  void setClassificacao(String? value) {
    dropValueClassificacao.value = value ?? '';
    classificacao = value;
  }

  void setProbabilidade(String? value) {
    dropValueProbabilidade.value = value ?? '';
    probabilidade = value;
  }

  void setGravidade(String? value) {
    dropValueGravidade.value = value ?? '';
    gravidade = value;
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onClickFinally() {
    if (validateForm()) {
      // Navigation logic will be handled in the UI
      // This method can be called from the UI to trigger navigation
    }
  }

  // Método para obter os dados do formulário como objeto Ativo
  Ativo getAtivoFromForm() {
    return Ativo(
      ativo: ativoController.text,
      classificacao: classificacao,
      ameacas: List.from(listAmeacas),
      fontesVazamento: List.from(listFontesVazamento),
      usosMaciliciosos: usosMaliciososController.text,
      risco: Risco(
        probabilidade: probabilidade,
        gravidade: gravidade,
      ),
      alertasPrevencao: alertasController.text,
      contramedidas: contramedidasController.text,
    );
  }

  // Método para verificar se há dados válidos no formulário
  bool hasValidData() {
    return ativoController.text.isNotEmpty &&
           (classificacao?.isNotEmpty ?? false) &&
           usosMaliciososController.text.isNotEmpty &&
           (probabilidade?.isNotEmpty ?? false) &&
           (gravidade?.isNotEmpty ?? false) &&
           alertasController.text.isNotEmpty &&
           contramedidasController.text.isNotEmpty;
  }

  // Método para obter ameaças selecionadas
  List<CheckboxModel> getAmeacasSelecionadas() {
    return listAmeacas.where((item) => item.value == true).toList();
  }

  // Método para obter fontes selecionadas
  List<CheckboxModel> getFontesSelecionadas() {
    return listFontesVazamento.where((item) => item.value == true).toList();
  }

  @override
  void onClose() {
    // Dispose controllers
    ativoController.dispose();
    usosMaliciososController.dispose();
    alertasController.dispose();
    contramedidasController.dispose();
    
    // Dispose ValueNotifiers
    dropValueClassificacao.dispose();
    dropValueProbabilidade.dispose();
    dropValueGravidade.dispose();
    
    super.onClose();
  }
}
