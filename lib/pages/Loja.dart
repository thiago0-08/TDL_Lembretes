import 'package:flutter/material.dart';

class LojaPage extends StatelessWidget {
  final List<Map<String, dynamic>> produtos = [
    {
      'nome': 'Gift Card',
      'preco': 'R\$ 500 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
    {
      'nome': 'Pacote de Moedas',
      'preco': 'R\$ 200 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
    {
      'nome': 'Desconto Premium',
      'preco': 'R\$ 100 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loja de Produtos"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ProdutoCard(
              nome: produto['nome'],
              preco: produto['preco'],
              imagem: produto['imagem'],
            ),
          );
        },
      ),
    );
  }
}

class ProdutoCard extends StatelessWidget {
  final String nome;
  final String preco;
  final String imagem;

  const ProdutoCard({
    required this.nome,
    required this.preco,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(imagem, fit: BoxFit.cover, height: 140),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  nome,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  preco,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Comprar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
