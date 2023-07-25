import 'package:flutter/material.dart';
import 'dart:typed_data';

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
        title: Text('Confirmação de Cadastro', style: TextStyle(fontFamily: 'Arial', fontSize: 18)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/Sead_Sup.png', height: 80, fit: BoxFit.contain), // Cabeçalho
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Responsabilidade de Cartões',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Emissor: $emissor',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Para: $para',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Unidade Recebedora: $unidadeRecebedora',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Cidade: $cidade',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nome do Responsável: $nomeResponsavel',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Matrícula: $matricula',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Assinatura:',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Container(
                          width: 140,
                          height: 40, // Definindo uma altura menor para a imagem da assinatura
                          child: Image.memory(assinatura, fit: BoxFit.cover), // Imagem da assinatura
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Colors.black, // Linha abaixo da imagem da assinatura
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Dados do Veículo',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    for (var veiculo in veiculos)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 12.0),
                          Text(
                            'Placa do Veículo: ${veiculo['placa']}',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Modelo do Veículo: ${veiculo['modelo']}',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Cota: ${veiculo['cota']}',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Combustível: ${veiculo['combustivel']}',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Documento: ${veiculo['documento']}',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
                  ],
                ),
              ),
              Image.asset('assets/images/Sead_inf.png', height: 80, fit: BoxFit.contain), // Rodapé
            ],
          ),
        ),
      ),
    );
  }
}
