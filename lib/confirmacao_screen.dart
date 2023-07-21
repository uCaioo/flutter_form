import 'package:flutter/material.dart';
import 'dart:typed_data';

class ConfirmacaoScreen extends StatelessWidget {
  final String nomeResponsavel;
  final String unidadeRecebedora;
  final String cidade;
  final String matricula;
  final Uint8List assinatura;
  final String placa;
  final String modelo;

  ConfirmacaoScreen({
    required this.nomeResponsavel,
    required this.unidadeRecebedora,
    required this.cidade,
    required this.matricula,
    required this.assinatura,
    required this.placa,
    required this.modelo,
  });

  @override
  Widget build(BuildContext context) {
    // Aqui você pode criar a tela de confirmação com os dados do veículo
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação de Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nome do Responsável: $nomeResponsavel',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Unidade Recebedora: $unidadeRecebedora',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Cidade: $cidade',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Matrícula: $matricula',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Image.memory(assinatura), // Exibe a imagem da assinatura
              SizedBox(height: 16.0),
              Text(
                'Placa do Veículo: $placa',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Modelo do Veículo: $modelo',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // Aqui você pode implementar a lógica para finalizar o cadastro
                  // e retornar à tela inicial ou a outra tela do seu aplicativo.
                  // Por exemplo, usando o Navigator.pop() para voltar para a tela anterior.
                  Navigator.pop(context);
                },
                child: Text('Finalizar Cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
