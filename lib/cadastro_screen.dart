import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'cadastro_veiculo_screen.dart';
import 'dart:typed_data';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
  );

  final SignatureController _signatureController2 = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
  );

  String _emissor = 'Departamento de Gestão de Frotas e Combustível - DGFC/SEAD';
  String _para = '';
  String _unidadeRecebedora = '';
  String _nomeResponsavel = '';
  String _matricula = '';
  String _cidade = 'Manaus-AM';
  bool _isFieldsFilled = false;

  void _limparAssinaturaResponsavel() {
    _signatureController.clear();
  }

  void _limparAssinaturaFiscal() {
    _signatureController2.clear();
  }


  void _navegarParaCadastroVeiculo() async {
    Uint8List? signatureBytes = await _signatureController.toPngBytes();
    Uint8List? signatureBytes2 = await _signatureController2.toPngBytes();
    if (signatureBytes != null && signatureBytes2 != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CadastroVeiculoScreen(
            emissor: _emissor,
            para: _para,
            unidadeRecebedora: _unidadeRecebedora,
            nomeResponsavel: _nomeResponsavel,
            cidade: _cidade,
            matricula: _matricula,
            assinatura: signatureBytes,
            assinatura2: signatureBytes2,
          ),
        ),
      );
    } else {
      // Tratar o cenário onde a assinatura não foi capturada corretamente
      // ou ocorreu algum erro ao converter para bytes.
      // Nesse caso, você pode mostrar um diálogo de erro ou tomar outra ação apropriada.
    }
  }

  void _checkFieldsFilled() {
    setState(() {
      _isFieldsFilled =
          _para.isNotEmpty &&
              _unidadeRecebedora.isNotEmpty &&
              _nomeResponsavel.isNotEmpty &&
              _matricula.isNotEmpty &&
              _cidade.isNotEmpty;
    });
  }

  Widget _buildFormFieldWithIcon(
      String label,
      IconData icon,
      String hintText,
      String value,
      Function(String) onChanged,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF43AD59),
          ),
        ),
        SizedBox(height: 4.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Color(0xFF43AD59), width: 2.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Color(0xFF43AD59),
                ),
              ),
              Expanded(
                child: TextFormField(
                  onChanged: onChanged,
                  initialValue: value,
                  style: TextStyle(color: Color(0xFF202F58)),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF202F58),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 10.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF43AD59),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFF43AD59),
          selectionHandleColor: Color(0xFF43AD59),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Color(0xFF43AD59),
          hoverColor: Color(0xFF43AD59),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              'Cadastro do Responsável',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color(0xFF43AD59),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFF202F58),
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFF43AD59),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emissor:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF43AD59),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        _emissor,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                      _buildFormFieldWithIcon(
                        'Para',
                        Icons.person,
                        'Digite a secretaria',
                        _para,
                            (value) {
                          setState(() {
                            _para = value;
                            _checkFieldsFilled();
                          });
                        },
                      ),
                      SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                      _buildFormFieldWithIcon(
                        'Unidade Recebedora',
                        Icons.business,
                        'Digite a unidade recebedora',
                        _unidadeRecebedora,
                            (value) {
                          setState(() {
                            _unidadeRecebedora = value;
                            _checkFieldsFilled();
                          });
                        },
                      ),
                      SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                      _buildFormFieldWithIcon(
                        'Cidade',
                        Icons.location_city,
                        'Digite a cidade',
                        _cidade,
                            (value) {
                          setState(() {
                            _cidade = value;
                            _checkFieldsFilled();
                          });
                        },
                      ),
                      SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                      _buildFormFieldWithIcon(
                        'Nome do Responsável pelos Cartões',
                        Icons.person,
                        'Digite o nome do responsável',
                        _nomeResponsavel,
                            (value) {
                          setState(() {
                            _nomeResponsavel = value;
                            _checkFieldsFilled();
                          });
                        },
                      ),
                      SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                      _buildFormFieldWithIcon(
                        'Matrícula',
                        Icons.badge,
                        'Digite a matrícula do responsável',
                        _matricula,
                            (value) {
                          setState(() {
                            _matricula = value;
                            _checkFieldsFilled();
                          });
                        },
                      ),
                      SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                      Text(
                        'Assinatura do responsável pelos cartões:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF43AD59),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Color(0xFF43AD59), width: 2.0),
                        ),
                        child: Stack(
                          children: [
                            Signature(
                              controller: _signatureController,
                              height: 110,
                              backgroundColor: Colors.white,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: _limparAssinaturaResponsavel, // Use a função de limpeza do responsável aqui
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 24.0), // Espaço abaixo do campo de assinatura
                      Text(
                        'Assinatura do fiscal:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF43AD59),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Color(0xFF43AD59), width: 2.0),
                        ),
                        child: Stack(
                          children: [
                            Signature(
                              controller: _signatureController2,
                              height: 110,
                              backgroundColor: Colors.white,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: _limparAssinaturaFiscal, // Use a função de limpeza do fiscal aqui
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 24.0), // Espaço abaixo dos campos de assinatura
                      Center(
                        child: ElevatedButton(
                          onPressed: _isFieldsFilled ? _navegarParaCadastroVeiculo : null,
                          child: Text('Enviar'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF43AD59),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            minimumSize: Size(200, 48),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
