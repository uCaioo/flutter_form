import 'package:flutter/material.dart';
import 'login.dart'; // Importe a tela LoginScreen

class AdmScreen extends StatelessWidget {
  final String adminName;

  AdmScreen({required this.adminName});

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
        title: Text('Tela de Administrador'),
        backgroundColor: Color(0xFF202F58),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF202F58),
              ),
              child: Text(
                'Menu Lateral',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Campos de Busca'),
              onTap: () {
                // Ação a ser executada ao selecionar "Campos de Busca"
              },
            ),
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text('Filtro'),
              onTap: () {
                // Ação a ser executada ao selecionar "Filtro"
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Documentos Gerados'),
              onTap: () {
                // Ação a ser executada ao selecionar "Documentos Gerados"
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Relatório'),
              onTap: () {
                // Ação a ser executada ao selecionar "Relatório"
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                // Ação a ser executada ao selecionar "Dashboard"
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Ação para fazer logout
                _logout(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            // O restante do conteúdo da tela de administrador aqui
            child: Text('Bem-vindo, $adminName!'),
          ),
        ),
      ),
    );
  }
}
