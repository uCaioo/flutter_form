import 'package:flutter/material.dart';

class RelatoriosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> relatorios;

  RelatoriosScreen({required this.relatorios});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Relatórios',
          style: TextStyle(color: Colors.white), // Define a cor do texto do título
        ),
        backgroundColor: Color(0xFF202F58), // Define a cor de fundo da barra de título
      ),
      body: ListView.builder(
        itemCount: relatorios.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Nome do Responsável: ${relatorios[index]['nomeResponsavel'] ?? 'N/A'}'),
            subtitle: Text('Matrícula: ${relatorios[index]['matricula'] ?? 'N/A'}'),
            onTap: () {
              _showDetailsFromReport(context, relatorios[index]);
            },
          );
        },
      ),
    );
  }

  void _showDetailsFromReport(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalhes do Registro'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Sead_Sup.png'), // Cabeçalho
                SizedBox(height: 16),
                _buildDetailRow('Emissor', data['emissor']),
                _buildDetailRow('Para', data['para']),
                _buildDetailRow('Unidade Recebedora', data['unidadeRecebedora']),
                _buildDetailRow('Cidade', data['cidade']),
                _buildDetailRow('Nome do Responsável', data['nomeResponsavel']),
                _buildDetailRow('Matrícula', data['matricula']),
                SizedBox(height: 16),
                _buildSignatureImage('Assinatura Responsável', data['assinaturaResponsavel']),
                _buildSignatureImage('Assinatura Fiscal', data['assinaturaFiscal']),
                if (data['veiculos'] != null) ..._buildVeiculos(data['veiculos']),
                SizedBox(height: 16),
                Image.asset('assets/images/Sead_inf.png'), // Rodapé
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Fechar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(text: '$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildSignatureImage(String title, String? imageUrl) {
    if (imageUrl == null) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.network(imageUrl, width: 150, height: 100),
        ),
      ],
    );
  }

  List<Widget> _buildVeiculos(List<dynamic>? veiculos) {
    if (veiculos == null || veiculos.isEmpty) {
      return [];
    }
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'Veículos:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: veiculos.map<Widget>((veiculo) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVeiculoDetail('Combustível', veiculo['combustivel']),
                _buildVeiculoDetail('Cota', veiculo['cota']),
                _buildVeiculoDetail('Modelo', veiculo['modelo']),
                _buildVeiculoDetail('Placa', veiculo['placa']),
                _buildVeiculoDetail('Documento', veiculo['documento']),
              ],
            ),
          );
        }).toList(),
      ),
    ];
  }

  Widget _buildVeiculoDetail(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(value ?? 'N/A', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
