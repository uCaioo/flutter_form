import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'confirmacao_screen.dart';

class CadastroVeiculoScreen extends StatefulWidget {
  final String emissor;
  final String para;
  final String unidadeRecebedora;
  final String cidade;
  final String nomeResponsavel;
  final String matricula;
  final Uint8List assinatura;

  CadastroVeiculoScreen({
    required this.emissor,
    required this.para,
    required this.unidadeRecebedora,
    required this.cidade,
    required this.nomeResponsavel,
    required this.matricula,
    required this.assinatura,
  });

  @override
  _CadastroVeiculoScreenState createState() => _CadastroVeiculoScreenState();
}

class _CadastroVeiculoScreenState extends State<CadastroVeiculoScreen> {
  String _placa = '';
  String _modelo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Veículo'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Emissor: ${widget.emissor}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Para: ${widget.para}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Unidade Recebedora: ${widget.unidadeRecebedora}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Cidade: ${widget.cidade}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Nome do Responsável: ${widget.nomeResponsavel}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Matrícula: ${widget.matricula}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Assinatura:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Image.memory(widget.assinatura), // Exibe a imagem da assinatura
              SizedBox(height: 16.0),
              Text(
                'Placa do Veículo:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _placa = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite a placa do veículo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Modelo do Veículo:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _modelo = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite o modelo do veículo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // Aqui você pode implementar a lógica para enviar os dados para a tela de confirmação
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmacaoScreen(
                        nomeResponsavel: widget.nomeResponsavel,
                        unidadeRecebedora: widget.unidadeRecebedora,
                        cidade: widget.cidade,
                        matricula: widget.matricula,
                        assinatura: widget.assinatura,
                        placa: _placa,
                        modelo: _modelo,
                      ),
                    ),
                  );
                },
                child: Text('Continuar'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
