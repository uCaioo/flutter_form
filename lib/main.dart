import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_screen.dart';
import 'welcome_screen.dart';
import 'select.dart'; // Importe a tela SelectScreen
import 'agradecimento.dart'; // Importe a tela AgradecimentoScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define o estilo da barra de status do aplicativo
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/', // Defina a rota inicial
      routes: {
        '/': (context) => LoadingScreen(), // Rota para a tela de carregamento
        '/select': (context) => SelectScreen(), // Rota para a tela de seleção
        '/agradecimento': (context) => AgradecimentoScreen(), // Rota para a tela de agradecimento
      },
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Adiciona um atraso de 3 segundos antes de navegar para a tela de seleção
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/select'); // Navega para a tela de seleção
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
