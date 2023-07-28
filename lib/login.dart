import 'package:flutter/material.dart';
import 'adm.dart'; // Importe aqui a tela de administrador (adm.dart)

class LoginScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _matriculaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF202F58),
      ),
      body: Container(
        color: Color(0xFF202F58),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 300,
              padding: EdgeInsets.all(20),
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
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/Logo_Sead.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'Primeiro Nome',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Último Nome',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _matriculaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Matrícula',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Autenticação do usuário
                      String firstName = _firstNameController.text;
                      String lastName = _lastNameController.text;
                      String matricula = _matriculaController.text;

                      if (firstName == 'Caio' && lastName == 'Medeiros' && matricula == '0000') {
                        Navigator.pushReplacement( // Utiliza pushReplacement ao fazer o login
                          context,
                          MaterialPageRoute(builder: (context) => AdmScreen(adminName: firstName)),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Erro de Autenticação'),
                            content: Text('Usuário ou senha incorretos.'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF43AD59),
                                  onPrimary: Colors.white,
                                ),
                                child: Text('Fechar'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF43AD59),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
