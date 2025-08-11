import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ptmol/src/modules/form/data/models/ativo.dart';
import 'package:ptmol/src/modules/form/data/models/checkbox_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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

  // Método para exportar como imagem
  Future<void> exportAsImage(GlobalKey repaintBoundaryKey) async {
    try {
      // Captura o widget como imagem
      RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Salva a imagem temporariamente
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/modelo_ameacas_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(imagePath);
      await file.writeAsBytes(pngBytes);

      // Compartilha a imagem
      await Share.shareXFiles(
        [XFile(imagePath)],
        text: 'Modelo de Ameaças - ${nomeAtivo}',
      );
    } catch (e) {
      print('Erro ao exportar imagem: $e');
      Get.snackbar(
        'Erro',
        'Não foi possível exportar a imagem',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}