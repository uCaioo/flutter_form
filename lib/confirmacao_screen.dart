import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'agradecimento.dart';

class ConfirmacaoScreen extends StatelessWidget {
  final String emissor;
  final String para;
  final String unidadeRecebedora;
  final String cidade;
  final String nomeResponsavel;
  final String matricula;
  final Uint8List assinatura;
  final List<Map<String, String>> veiculos;

  ConfirmacaoScreen({
    required this.emissor,
    required this.para,
    required this.unidadeRecebedora,
    required this.cidade,
    required this.nomeResponsavel,
    required this.matricula,
    required this.assinatura,
    required this.veiculos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação de Cadastro'),
        backgroundColor: Color(0xFF43AD59),
      ),
      body: Container(
        color: Color(0xFF202F58), // Cor de fundo para cobrir o espaço em branco
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabeçalho com imagem dentro do container
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset(
                      'assets/images/Sead_Sup.png', fit: BoxFit.contain),
                ),
              ),
              // Corpo do formulário centralizado
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responsabilidade dos Cartões',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Emissor: $emissor',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      Text(
                        'Para: $para',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      Text(
                        'Unidade Recebedora: $unidadeRecebedora',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      Text(
                        'Cidade: $cidade',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      Text(
                        'Nome do Responsável: $nomeResponsavel',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      Text(
                        'Matrícula: $matricula',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Assinatura:',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: 100,
                        height: 80,
                        child: Image.memory(assinatura, fit: BoxFit.contain),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Dados do Veículo:',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      SizedBox(height: 10.0),
                      for (var i = 0; i < veiculos.length; i++)
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          elevation: 2,
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Veículo ${i + 1}:',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF43AD59),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Placa: ${veiculos[i]['placa']}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Modelo: ${veiculos[i]['modelo']}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Cota: ${veiculos[i]['cota']}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Combustível: ${veiculos[i]['combustivel']}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Documento: ${veiculos[i]['documento']}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      // Botão "Gerar comprovante"
                      Center(
                        child: Column(
                          children: [
                            // Botão "Gerar Comprovante"
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: _gerarPDF,
                                // Chama a função para gerar o PDF
                                child: Text(
                                  'Gerar Comprovante',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 18.0,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF43AD59), // Cor do botão
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                ),
                              ),
                            ),

                            // Botão "Finalizar Cadastro"
                            ElevatedButton(
                              onPressed: () {
                                // Ação a ser executada ao pressionar o botão "Finalizar Cadastro"
                                Navigator.pushNamed(context, '/agradecimento');
                              },
                              child: Text(
                                'Finalizar Cadastro',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF202F58), // Cor do botão
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              // Rodapé com imagem dentro do container
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset(
                      'assets/images/Sead_inf.png', fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para gerar e abrir o PDF
  Future<void> _gerarPDF() async {
    final pdf = pw.Document();

    // Load images from the assets/images directory
    final headerImage = (await rootBundle.load('assets/images/Sead_Sup.png'))
        .buffer.asUint8List();
    final footerImage = (await rootBundle.load('assets/images/Sead_inf.png'))
        .buffer.asUint8List();

    // Get the current date and time
    final currentDate = DateTime.now();
    final formattedDate = "${currentDate.day} de ${_getMonthName(
        currentDate.month)} de ${currentDate.year} ${currentDate
        .hour}:${currentDate.minute}";

    // Create the PDF content
    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) =>
        [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Comprovante de Cadastro', style: pw.TextStyle(
                  fontSize: 20.0, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10.0),
              pw.Text('Emissor: $emissor'),
              pw.Text('Para: $para'),
              pw.Text('Unidade Recebedora: $unidadeRecebedora'),
              pw.Text('Cidade: $cidade'),
              pw.Text('Nome do Responsável: $nomeResponsavel'),
              pw.Text('Matrícula: $matricula'),
              pw.SizedBox(height: 16.0),
              pw.Text(
                'Assinatura do responsável:',
                style: pw.TextStyle(fontSize: 14.0),
              ),
              pw.SizedBox(height: 5.0),
              pw.Container(
                width: 100,
                height: 80,
                child: pw.Image(pw.MemoryImage(assinatura)),
              ),
              pw.SizedBox(height: 16.0),
              pw.Text(
                'Dados do Veículo:',
                style: pw.TextStyle(
                  fontSize: 20.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10.0),
              for (var i = 0; i < veiculos.length; i++)
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Veículo ${i + 1}:',
                      style: pw.TextStyle(
                        fontSize: 18.0,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.green,
                      ),
                    ),
                    pw.SizedBox(height: 8.0),
                    pw.Text('Placa: ${veiculos[i]['placa']}'),
                    pw.Text('Modelo: ${veiculos[i]['modelo']}'),
                    pw.Text('Cota: ${veiculos[i]['cota']}'),
                    pw.Text('Combustível: ${veiculos[i]['combustivel']}'),
                    pw.Text('Documento: ${veiculos[i]['documento']}'),
                    pw.SizedBox(height: 16.0),
                  ],
                ),
            ],
          ),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              "Manaus - $formattedDate",
              style: pw.TextStyle(fontSize: 12),
            ),
          ),
        ],
        header: (pw.Context context) {
          return pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Image(pw.MemoryImage(headerImage)),
          );
        },
        footer: (pw.Context context) {
          return pw.Container(
            alignment: pw.Alignment.centerRight,
            child: pw.Image(pw.MemoryImage(footerImage)),
          );
        },
      ),
    );

    // Save the PDF to a temporary file
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/comprovante.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the PDF on the device
    await OpenFile.open(file.path);
  }

  String _getMonthName(int month) {
    const monthNames = {
      1: 'Janeiro', 2: 'Fevereiro', 3: 'Março', 4: 'Abril',
      5: 'Maio', 6: 'Junho', 7: 'Julho', 8: 'Agosto',
      9: 'Setembro', 10: 'Outubro', 11: 'Novembro', 12: 'Dezembro',
    };
    return monthNames[month] ?? '';
  }
}