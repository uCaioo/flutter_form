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
  List<Map<String, String>> _veiculos = [];
  List<Map<String, String>> _veiculosConfirmados = [];

  bool _canContinue() {
    // Verifica se todos os campos estão preenchidos para permitir continuar
    for (var veiculo in _veiculos) {
      if (veiculo.containsValue('')) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Veículo'),
        backgroundColor: Color(0xFF43AD59), // Cor de fundo da AppBar
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white, // Cor de fundo da tela
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _veiculos.add({
                      'placa': '',
                      'modelo': '',
                      'cota': '',
                      'combustivel': '',
                      'documento': '',
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF43AD59), // Cor de fundo do botão
                  onPrimary: Colors.white, // Cor do texto do botão
                ),
                child: Text('Adicionar Veículo'),
              ),
              SizedBox(height: 16.0),
              for (int i = 0; i < _veiculos.length; i++)
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_car, color: Color(0xFF43AD59)), // Ícone do carro
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _veiculos[i]['placa'] = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Digite a placa do veículo',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                initialValue: _veiculos[i]['placa'],
                                enabled: !_veiculosConfirmados.contains(_veiculos[i]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.car_rental, color: Color(0xFF43AD59)), // Ícone do modelo
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _veiculos[i]['modelo'] = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Digite o modelo do veículo',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                initialValue: _veiculos[i]['modelo'],
                                enabled: !_veiculosConfirmados.contains(_veiculos[i]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.grid_view, color: Color(0xFF43AD59)), // Ícone da cota
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _veiculos[i]['cota'] = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Digite a cota',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                initialValue: _veiculos[i]['cota'],
                                enabled: !_veiculosConfirmados.contains(_veiculos[i]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.local_gas_station, color: Color(0xFF43AD59)), // Ícone do combustível
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _veiculos[i]['combustivel'] = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Digite o combustível',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                initialValue: _veiculos[i]['combustivel'],
                                enabled: !_veiculosConfirmados.contains(_veiculos[i]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.description, color: Color(0xFF43AD59)), // Ícone do documento
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _veiculos[i]['documento'] = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Digite o documento',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                initialValue: _veiculos[i]['documento'],
                                enabled: !_veiculosConfirmados.contains(_veiculos[i]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        if (!_veiculosConfirmados.contains(_veiculos[i]))
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red), // Ícone de exclusão
                                onPressed: () {
                                  setState(() {
                                    _veiculos.removeAt(i);
                                  });
                                },
                              ),

                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _canContinue()
                    ? () {
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
                        veiculos: _veiculosConfirmados,
                        emissor: widget.emissor, // Adicionando o campo emissor
                        para: widget.para, // Adicionando o campo para
                      ),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF43AD59), // Cor de fundo do botão
                  onPrimary: Colors.white, // Cor do texto do botão
                ),
                child: Text('Continuar'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
