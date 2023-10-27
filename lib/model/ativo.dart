import 'dart:convert';

class Ativo {
  final String ativo;
  final String classificacao;
  final List<String> ameacas;
  final List<String> fontesVazamento;
  final String usosMaciliciosos;
  final Risco risco;
  final String alertasPrevencao;
  final String contramedidas;

  Ativo({
    required this.ativo,
    required this.classificacao,
    required this.ameacas,
    required this.fontesVazamento,
    required this.usosMaciliciosos,
    required this.risco,
    required this.alertasPrevencao,
    required this.contramedidas,
  });

  Ativo copyWith({
    String? ativo,
    String? classificacao,
    List<String>? ameacas,
    List<String>? fontesVazamento,
    String? usosMaciliciosos,
    Risco? risco,
    String? alertasPrevencao,
    String? contramedidas,
  }) =>
      Ativo(
        ativo: ativo ?? this.ativo,
        classificacao: classificacao ?? this.classificacao,
        ameacas: ameacas ?? this.ameacas,
        fontesVazamento: fontesVazamento ?? this.fontesVazamento,
        usosMaciliciosos: usosMaciliciosos ?? this.usosMaciliciosos,
        risco: risco ?? this.risco,
        alertasPrevencao: alertasPrevencao ?? this.alertasPrevencao,
        contramedidas: contramedidas ?? this.contramedidas,
      );

  factory Ativo.fromJson(String str) => Ativo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ativo.fromMap(Map<String, dynamic> json) => Ativo(
        ativo: json["ativo"],
        classificacao: json["classificacao"],
        ameacas: List<String>.from(json["ameacas"].map((x) => x)),
        fontesVazamento:
            List<String>.from(json["fontesVazamento"].map((x) => x)),
        usosMaciliciosos: json["usosMaciliciosos"],
        risco: Risco.fromMap(json["risco"]),
        alertasPrevencao: json["alertasPrevencao"],
        contramedidas: json["contramedidas"],
      );

  Map<String, dynamic> toMap() => {
        "ativo": ativo,
        "classificacao": classificacao,
        "ameacas": List<dynamic>.from(ameacas.map((x) => x)),
        "fontesVazamento": List<dynamic>.from(fontesVazamento.map((x) => x)),
        "usosMaciliciosos": usosMaciliciosos,
        "risco": risco.toMap(),
        "alertasPrevencao": alertasPrevencao,
        "contramedidas": contramedidas,
      };
}

class Risco {
  final String probabilidade;
  final String gravidade;

  Risco({
    required this.probabilidade,
    required this.gravidade,
  });

  Risco copyWith({
    String? probabilidade,
    String? gravidade,
  }) =>
      Risco(
        probabilidade: probabilidade ?? this.probabilidade,
        gravidade: gravidade ?? this.gravidade,
      );

  factory Risco.fromJson(String str) => Risco.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Risco.fromMap(Map<String, dynamic> json) => Risco(
        probabilidade: json["probabilidade"],
        gravidade: json["gravidade"],
      );

  Map<String, dynamic> toMap() => {
        "probabilidade": probabilidade,
        "gravidade": gravidade,
      };
}
