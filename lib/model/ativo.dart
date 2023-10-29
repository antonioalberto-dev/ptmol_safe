import 'package:ptmol/model/checkbox_model.dart';

class Ativo {
  String? ativo;
  String? classificacao;
  List<CheckboxModel>? ameacas;
  List<CheckboxModel>? fontesVazamento;
  String? usosMaciliciosos;
  Risco? risco;
  String? alertasPrevencao;
  String? contramedidas;

  Ativo(
      {this.ativo,
      this.classificacao,
      this.ameacas,
      this.fontesVazamento,
      this.usosMaciliciosos,
      this.risco,
      this.alertasPrevencao,
      this.contramedidas});

  Ativo.fromJson(Map<String, dynamic> json) {
    ativo = json['ativo'];
    classificacao = json['classificacao'];
    ameacas = json['ameacas'].cast<String>();
    fontesVazamento = json['fontesVazamento'].cast<String>();
    usosMaciliciosos = json['usosMaciliciosos'];
    risco = json['risco'] != null ? Risco.fromJson(json['risco']) : null;
    alertasPrevencao = json['alertasPrevencao'];
    contramedidas = json['contramedidas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ativo'] = ativo;
    data['classificacao'] = classificacao;
    data['ameacas'] = ameacas;
    data['fontesVazamento'] = fontesVazamento;
    data['usosMaciliciosos'] = usosMaciliciosos;
    if (risco != null) {
      data['risco'] = risco!.toJson();
    }
    data['alertasPrevencao'] = alertasPrevencao;
    data['contramedidas'] = contramedidas;
    return data;
  }
}

class Risco {
  String? probabilidade;
  String? gravidade;

  Risco({this.probabilidade, this.gravidade});

  Risco.fromJson(Map<String, dynamic> json) {
    probabilidade = json['probabilidade'];
    gravidade = json['gravidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['probabilidade'] = probabilidade;
    data['gravidade'] = gravidade;
    return data;
  }
}
