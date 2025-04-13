import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    {
      'nome': 'Super Oferta',
      'preco': 'R\$ 50 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 600 ? 2 : 4;

    return Scaffold(
      appBar: AppBar(
        title: Text("Loja de Produtos", style: GoogleFonts.poppins()),
        backgroundColor: const Color.fromARGB(255, 0, 92, 250),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65, // Aqui ajusta a altura dos cards
        ),
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return ProdutoCard(
            nome: produto['nome'],
            preco: produto['preco'],
            imagem: produto['imagem'],
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  imagem,
                  height: constraints.maxHeight * 0.4, // 40% da altura total
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      nome,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      preco,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 36,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder:
                                (BuildContext context) => AlertDialog(
                                  title: Text('Confirmar Compra'),
                                  content: Text(
                                    'Deseja realmente comprar o produto "$nome"?',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed:
                                          () => Navigator.pop(
                                            context,
                                            'Cancelar',
                                          ),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Confirmar');

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text('Compra confirmada!'),
                                          ),
                                        );
                                      },
                                      child: const Text('Confirmar'),
                                    ),
                                  ],
                                ),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 16,
                        ),
                        label: const Text(
                          "Comprar",
                          style: TextStyle(fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
