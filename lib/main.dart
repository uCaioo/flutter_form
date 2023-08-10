import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'splash_screen.dart';
import 'welcome_screen.dart';
import 'select.dart';
import 'agradecimento.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/select': (context) => SelectScreen(),
        '/agradecimento': (context) => AgradecimentoScreen(),
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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/select');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

void testFirestoreConnection() async {
  try {
    CollectionReference testCollection =
    FirebaseFirestore.instance.collection('test');

    await testCollection.add({
      'message': 'tankei a firebase!',
      'timestamp': FieldValue.serverTimestamp(),
    });

    CollectionReference anotherTestCollection =
    FirebaseFirestore.instance.collection('another_test');

    await anotherTestCollection.add({
      'message': 'O caio finalmente tankou a Firebase!',
      'timestamp': FieldValue.serverTimestamp(),
    });

    CollectionReference firebaseFoiTankadaCollection =
    FirebaseFirestore.instance.collection('firebase_foi_tankada');

    await firebaseFoiTankadaCollection.add({
      'message': 'A Firebase foi tankada com sucesso!',
      'timestamp': FieldValue.serverTimestamp(),
    });

    print('Teste de conexão com o Firestore bem-sucedido!');
  } catch (e) {
    print('Erro ao testar a conexão com o Firestore: $e');
  }
}

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Realizar o teste de conexão e adicionar dados às coleções
    testFirestoreConnection();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Seleção'),
      ),
      body: Center(
        child: Text('Teste de conexão realizado. Verifique o console para detalhes.'),
      ),
    );
  }
}

class AgradecimentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Agradecimento'),
      ),
      body: Center(
        child: Text('Obrigado por usar o aplicativo!'),
      ),
    );
  }
}
