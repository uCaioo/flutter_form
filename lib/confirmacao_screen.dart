import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'agradecimento.dart'; // Certifique-se de importar a classe AgradecimentoScreen
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importe a biblioteca do Cloud Firestore




class ConfirmacaoScreen extends StatelessWidget {
  final String emissor;
  final String para;
  final String unidadeRecebedora;
  final String cidade;
  final String nomeResponsavel;
  final String matricula;
  final Uint8List assinatura;
  final Uint8List assinatura2; // Adicione a segunda assinatura aqui
  final List<Map<String, String>> veiculos;

  ConfirmacaoScreen({
    required this.emissor,
    required this.para,
    required this.unidadeRecebedora,
    required this.cidade,
    required this.nomeResponsavel,
    required this.matricula,
    required this.assinatura,
    required this.assinatura2, // Adicione a segunda assinatura aqui
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
                        'Assinatura do responsável pelos cartões:',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left, // Alinha o texto à esquerda
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: 200,
                        height: 100,
                        child: Image.memory(assinatura, fit: BoxFit.contain),
                      ),

                      SizedBox(height: 16.0),
                      Text(
                        'Assinatura do fiscal:',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: 200,
                        height: 100,
                        child: Image.memory(assinatura2, fit: BoxFit.contain),
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

                            // Botão "Finalizar Cadastro"
                            ElevatedButton(
                              onPressed: () async {
                                // Crie um mapa com os dados do cadastro
                                Map<String, dynamic> data = {
                                  'emissor': emissor,
                                  'para': para,
                                  'unidadeRecebedora': unidadeRecebedora,
                                  'cidade': cidade,
                                  'nomeResponsavel': nomeResponsavel,
                                  'matricula': matricula,
                                  'assinatura': assinatura,
                                  'assinatura2': assinatura2,
                                  'veiculos': veiculos,
                                };

                                // Referência à coleção "cadastros"
                                CollectionReference cadastros = FirebaseFirestore.instance.collection('cadastros');

                                try {
                                  // Envie os dados para o Firebase
                                  await cadastros.add(data);

                                  // Navegue para a tela de agradecimento
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AgradecimentoScreen(
                                        emissor: emissor,
                                        para: para,
                                        unidadeRecebedora: unidadeRecebedora,
                                        cidade: cidade,
                                        nomeResponsavel: nomeResponsavel,
                                        matricula: matricula,
                                        assinatura: assinatura,
                                        assinatura2: assinatura2,
                                        veiculos: veiculos,
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  // Trate erros de envio para o Firebase
                                  print('Erro ao enviar dados para o Firebase: $e');
                                }
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

}