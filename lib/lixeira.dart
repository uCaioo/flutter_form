import 'package:flutter/material.dart';

class LixeiraScreen extends StatefulWidget {
  final List<Map<String, dynamic>> lixeira;

  LixeiraScreen({required this.lixeira});

  @override
  _LixeiraScreenState createState() => _LixeiraScreenState();
}

class _LixeiraScreenState extends State<LixeiraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lixeira',
          style: TextStyle(color: Colors.white), // Define a cor do texto do título
        ),
        backgroundColor: Color(0xFF202F58), // Define a cor de fundo da barra de título
      ),
      body: ListView.builder(
        itemCount: widget.lixeira.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Nome do Responsável: ${widget.lixeira[index]['nomeResponsavel'] ?? 'N/A'}'),
            subtitle: Text('Matrícula: ${widget.lixeira[index]['matricula'] ?? 'N/A'}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.restore, color: Color(0xFF43AD59)),
                  onPressed: () {
                    _restoreFromTrash(widget.lixeira[index]);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete_forever, color: Colors.red),
                  onPressed: () {
                    _deleteFromTrash(widget.lixeira[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _restoreFromTrash(Map<String, dynamic> relatorio) {
    // Implementar lógica para restaurar o relatório
  }

  void _deleteFromTrash(Map<String, dynamic> relatorio) {
    // Implementar lógica para excluir permanentemente o relatório
  }
}
