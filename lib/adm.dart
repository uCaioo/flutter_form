import 'package:flutter/material.dart';
import 'login.dart'; // Importe a tela LoginScreen

class AdmScreen extends StatefulWidget {
  final String adminName;

  AdmScreen({required this.adminName});

  @override
  _AdmScreenState createState() => _AdmScreenState();
}

class _AdmScreenState extends State<AdmScreen> {
  // Função para fazer logout e voltar para a tela de login
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Navega para a tela de login
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DGFC/SEAD'), // Nome do app
        backgroundColor: Color(0xFF202F58), // Cor padrão do AppBar
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Cor de fundo do Drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white, // Cor de fundo do DrawerHeader
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Logo_Sead.png', // Caminho da imagem do logo
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.search, color: Color(0xFF43AD59)), // Mudar cor do ícone
                title: Text('Campos de Busca'),
                onTap: () {
                  // Ação a ser executada ao selecionar "Campos de Busca"
                },
              ),
              ListTile(
                leading: Icon(Icons.filter_list, color: Color(0xFF43AD59)), // Mudar cor do ícone
                title: Text('Filtro'),
                onTap: () {
                  // Ação a ser executada ao selecionar "Filtro"
                },
              ),
              ListTile(
                leading: Icon(Icons.bar_chart, color: Color(0xFF43AD59)), // Mudar cor do ícone
                title: Text('Relatório'),
                onTap: () {
                  // Ação a ser executada ao selecionar "Relatório"
                },
              ),
              ListTile(
                leading: Icon(Icons.dashboard, color: Color(0xFF43AD59)), // Mudar cor do ícone
                title: Text('Dashboard'),
                onTap: () {
                  // Ação a ser executada ao selecionar "Dashboard"
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Color(0xFF43AD59)), // Mudar cor do ícone
                title: Text('Logout'),
                onTap: () {
                  // Ação para fazer logout
                  _logout(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo_Sead.png', // Caminho da imagem do logo
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Bem-vindo, ${widget.adminName}!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF43AD59), // Cor da mensagem de boas-vindas
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}