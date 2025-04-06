import 'package:flutter/material.dart';

void main() => runApp(const ListTileApp());

class ListTileApp extends StatelessWidget {
  const ListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ListTileExample(),
    );
  }
}

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas ')),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Atividade Ciencia de Dados - 10:00 AM'),
            subtitle: Text('Atividade para ser entregue na Quarta feira'),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('B')),
            title: Text('Dentista - 13:40 '),
            subtitle: Text('Consulta de rotina com o dentista.'),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('C')),
            title: Text('Atividade de Frontend - 17:00'),
            subtitle: Text("Atividade Formulario para o curso de Frontend."),

            isThreeLine: true,
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
