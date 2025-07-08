import 'package:get/get.dart';
import 'package:ptmol/src/modules/form/data/models/ativo.dart';
import 'package:ptmol/src/modules/form/data/models/checkbox_model.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class DetailsViewmodel extends GetxController {
  // Dados do ativo preenchidos no formulário
  Ativo? _ativo;
  Ativo? get ativo => _ativo;

  // Propriedades individuais para fácil acesso
  String get nomeAtivo => _ativo?.ativo ?? '';
  String get classificacao => _ativo?.classificacao ?? '';
  String get usosMaliciosos => _ativo?.usosMaciliciosos ?? '';
  String get alertasPrevencao => _ativo?.alertasPrevencao ?? '';
  String get contramedidas => _ativo?.contramedidas ?? '';
  String get probabilidade => _ativo?.risco?.probabilidade ?? '';
  String get gravidade => _ativo?.risco?.gravidade ?? '';
  
  // Listas de ameaças e fontes selecionadas
  List<CheckboxModel> get ameacasSelecionadas => 
    _ativo?.ameacas?.where((item) => item.value == true).toList() ?? [];
  
  List<CheckboxModel> get fontesSelecionadas => 
    _ativo?.fontesVazamento?.where((item) => item.value == true).toList() ?? [];

  // Método para receber dados do formulário
  void setDadosFormulario({
    required String ativo,
    required String? classificacao,
    required List<CheckboxModel> ameacas,
    required List<CheckboxModel> fontesVazamento,
    required String usosMaliciosos,
    required String? probabilidade,
    required String? gravidade,
    required String alertasPrevencao,
    required String contramedidas,
  }) {
    _ativo = Ativo(
      ativo: ativo,
      classificacao: classificacao,
      ameacas: ameacas,
      fontesVazamento: fontesVazamento,
      usosMaciliciosos: usosMaliciosos,
      risco: Risco(
        probabilidade: probabilidade,
        gravidade: gravidade,
      ),
      alertasPrevencao: alertasPrevencao,
      contramedidas: contramedidas,
    );
    update();
  }

  // Método para receber diretamente um objeto Ativo
  void setAtivo(Ativo ativo) {
    _ativo = ativo;
    update();
  }

  // Verificações de validação
  bool get hasAtivo => nomeAtivo.isNotEmpty;
  bool get hasClassificacao => classificacao.isNotEmpty;
  bool get hasUsosMaliciosos => usosMaliciosos.isNotEmpty;
  bool get hasAlertasPrevencao => alertasPrevencao.isNotEmpty;
  bool get hasContramedidas => contramedidas.isNotEmpty;
  bool get hasRisco => probabilidade.isNotEmpty && gravidade.isNotEmpty;
  bool get hasAmeacas => ameacasSelecionadas.isNotEmpty;
  bool get hasFontes => fontesSelecionadas.isNotEmpty;

  // Método para limpar dados
  void limparDados() {
    _ativo = null;
    update();
  }

  // Método para gerar PDF
  Future<void> printDoc() async {
    final doc = pw.Document();
    final styleTitulo = pw.TextStyle(fontWeight: pw.FontWeight.bold);
    
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    "MODELO DE AMEAÇAS",
                    style: styleTitulo.copyWith(fontSize: 20),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text("Ativo: ${nomeAtivo}", style: styleTitulo),
                pw.SizedBox(height: 10),
                pw.Text("Classificação: $classificacao"),
                pw.SizedBox(height: 10),
                if (hasUsosMaliciosos) ...[
                  pw.Text("Usos maliciosos:", style: styleTitulo),
                  pw.Text(usosMaliciosos),
                  pw.SizedBox(height: 10),
                ],
                if (hasRisco) ...[
                  pw.Text("Risco:", style: styleTitulo),
                  pw.Text("Probabilidade: $probabilidade"),
                  pw.Text("Gravidade: $gravidade"),
                  pw.SizedBox(height: 10),
                ],
                if (hasAmeacas) ...[
                  pw.Text("Ameaças de privacidade:", style: styleTitulo),
                  ...ameacasSelecionadas.map((ameaca) => pw.Text("• ${ameaca.title}")),
                  pw.SizedBox(height: 10),
                ],
                if (hasFontes) ...[
                  pw.Text("Fontes de vazamento:", style: styleTitulo),
                  ...fontesSelecionadas.map((fonte) => pw.Text("• ${fonte.title}")),
                  pw.SizedBox(height: 10),
                ],
                if (hasAlertasPrevencao) ...[
                  pw.Text("Alertas de prevenção:", style: styleTitulo),
                  pw.Text(alertasPrevencao),
                  pw.SizedBox(height: 10),
                ],
                if (hasContramedidas) ...[
                  pw.Text("Contramedidas:", style: styleTitulo),
                  pw.Text(contramedidas),
                ],
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
    );
  }
}