import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../main.dart';
import 'CriaLembrete.dart';
import 'Loja.dart';
// import 'SeusLembrete.dart';
import 'Calendario.dart';
import 'ListaDeTarefas.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Página Inicial")),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 60,
        items: <Widget>[
          Icon (Icons.exit_to_app, size: 30,color: const Color.fromARGB(255, 0, 0, 0),),
          // Icon (Icons.event_note, size: 30,color: const Color.fromARGB(255, 0, 0, 0),),
          Icon (Icons.check_circle,size: 30,color: const Color.fromARGB(255, 0, 0, 0),),
          Icon (Icons.add, size: 30, color: const Color.fromARGB(255, 0, 0, 0)),
          Icon (Icons.store, size: 30, color: Colors.black),
          Icon (Icons.calendar_month, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          // if (index == 0) {
          //   Navigator.push(    
          //     context,
          //     MaterialPageRoute(builder: (context) => SeusLembretesPage()),
          //   );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LojaPage()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalendarioPage()),
            );
           } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaginaLembrete()),
            );
           } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Lista_de_TarefasPage()),
            );
          }          
        },
      ),
    );
  }
}
