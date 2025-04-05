import 'package:flutter/material.dart';

import 'CriaLembrete.dart';

class Lista_de_TarefasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suas Tarefas")),
      body: Center(child: Text("Página de Lista de Tarefas")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação ao pressionar o botão flutuante
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LembretePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
