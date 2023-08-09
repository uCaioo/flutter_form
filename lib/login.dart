import 'package:flutter/material.dart';
import 'adm.dart'; // Importe aqui a tela de administrador (adm.dart)

class LoginScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Adicionamos um FocusNode para cada campo
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF202F58),
      ),
      resizeToAvoidBottomInset: false,
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
                  width: 3,
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
                    focusNode: _firstNameFocusNode, // Vinculamos o FocusNode ao campo
                    decoration: InputDecoration(
                      labelText: 'Primeiro Nome',
                      prefixIcon: Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _lastNameController,
                    focusNode: _lastNameFocusNode, // Vinculamos o FocusNode ao campo
                    decoration: InputDecoration(
                      labelText: 'Último Nome',
                      prefixIcon: Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode, // Vinculamos o FocusNode ao campo
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF43AD59), width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Autenticação do usuário
                      String firstName = _firstNameController.text;
                      String lastName = _lastNameController.text;
                      String password = _passwordController.text;

                      if (firstName == 'Admin' && lastName == 'Teste' && password == '123') {
                        Navigator.pushReplacement( // Utiliza pushReplacement ao fazer o login
                          context,
                          MaterialPageRoute(builder: (context) => AdmScreen(adminName: firstName)),
                        );
                      }

                      if (firstName == 'Caio' && lastName == 'Medeiros' && password == '123') {
                        Navigator.pushReplacement( // Utiliza pushReplacement ao fazer o login
                          context,
                          MaterialPageRoute(builder: (context) => AdmScreen(adminName: firstName)),
                        );
                      }

                      if (firstName == 'Tarcio' && lastName == 'Amorim' && password == '123') {
                        Navigator.pushReplacement( // Utiliza pushReplacement ao fazer o login
                          context,
                          MaterialPageRoute(builder: (context) => AdmScreen(adminName: firstName)),
                        );
                      }

                      else {
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // Container com a cor de fundo para o espaço em branco
      bottomSheet: Container(
        color: Color(0xFF202F58),
        height: MediaQuery.of(context).viewInsets.bottom, // Altura igual à parte inferior do teclado
      ),
    );
  }
}
