import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'welcome_screen.dart';

class AgradecimentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agradecimento'),
        backgroundColor: Color(0xFF202F58), // Define a cor de fundo da barra de navegação
      ),
      body: Container(
        color: Color(0xFF202F58), // Cor de fundo para cobrir o espaço em branco
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.thumb_up,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Obrigado pelo cadastro!',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Seu cadastro foi concluído com sucesso.',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Ação a ser executada ao pressionar o botão "Realizar outro cadastro"
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      );
                    },
                    icon: Icon(Icons.add_circle),
                    label: Text(
                      'Realizar outro cadastro',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF43AD59), // Cor do botão
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      minimumSize: Size(150, 0), // Tamanho mínimo do botão
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Ação a ser executada ao pressionar o botão "Sair"
                      SystemNavigator.pop(); // Fecha o app
                    },
                    icon: Icon(Icons.exit_to_app),
                    label: Text(
                      'Sair',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Cor do botão
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      minimumSize: Size(150, 0), // Tamanho mínimo do botão
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
