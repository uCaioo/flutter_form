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

  String _emissor = 'Departamento de Gestão de Frotas e Combustível - DGFC/SEAD';
  String _para = '';
  String _unidadeRecebedora = '';
  String _nomeResponsavel = '';
  String _matricula = '';
  String _cidade = 'Manaus-AM';
  bool _isFieldsFilled = false;

  void _limparAssinatura() {
    _signatureController.clear();
  }

  void _navegarParaCadastroVeiculo() async {
    Uint8List? signatureBytes = await _signatureController.toPngBytes();
    if (signatureBytes != null) {
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
                Text(
                  'Emissor:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _emissor,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                Text(
                  'Para:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Color(0xFF43AD59), width: 2.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _para = value;
                        _checkFieldsFilled();
                      });
                    },
                    style: TextStyle(color: Color(0xFF202F58)),
                    decoration: InputDecoration(
                      hintText: 'Digite o destinatário',
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
                SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                Text(
                  'Unidade Recebedora:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Color(0xFF43AD59), width: 2.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _unidadeRecebedora = value;
                        _checkFieldsFilled();
                      });
                    },
                    style: TextStyle(color: Color(0xFF202F58)),
                    decoration: InputDecoration(
                      hintText: 'Digite a unidade recebedora',
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
                SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                Text(
                  'Cidade:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Color(0xFF43AD59), width: 2.0),
                  ),
                  child: TextFormField(
                    initialValue: _cidade,
                    onChanged: (value) {
                      setState(() {
                        _cidade = value;
                        _checkFieldsFilled();
                      });
                    },
                    style: TextStyle(color: Color(0xFF202F58)),
                    decoration: InputDecoration(
                      hintText: 'Digite a cidade',
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
                SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                Text(
                  'Nome do Responsável pelos Cartões:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Color(0xFF43AD59), width: 2.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _nomeResponsavel = value;
                        _checkFieldsFilled();
                      });
                    },
                    style: TextStyle(color: Color(0xFF202F58)),
                    decoration: InputDecoration(
                      hintText: 'Digite o nome do responsável',
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
                SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                Text(
                  'Matrícula:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Color(0xFF43AD59), width: 2.0),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _matricula = value;
                        _checkFieldsFilled();
                      });
                    },
                    style: TextStyle(color: Color(0xFF202F58)),
                    decoration: InputDecoration(
                      hintText: 'Digite a matrícula',
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
                SizedBox(height: 24.0), // Espaço entre a assinatura e o botão "Enviar"
                Text(
                  'Assinatura do Responsável:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                          onPressed: _limparAssinatura,
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0), // Espaço abaixo do campo de assinatura
                ElevatedButton(
                  onPressed: _isFieldsFilled ? _navegarParaCadastroVeiculo : null,
                  child: Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF43AD59),
                    textStyle: TextStyle(color: Colors.white),
                    minimumSize: Size(double.infinity, 40.0),
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
