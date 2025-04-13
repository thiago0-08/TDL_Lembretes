import 'package:flutter/material.dart';
import '../main.dart';
import 'CriaLembrete.dart';
import 'Loja.dart';
import 'Calendario.dart';
import 'ListaDeTarefas.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    Center(child: Text('Página Inicial', style: TextStyle(fontSize: 24))),
    ListTileApp(),
    PaginaLembrete(),
    CalendarioPage(),
    LojaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: AssetImage('assets/tdl.png')),
          ),
          title: Text(
            "Página Inicial",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              tooltip: "Sair do app",
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: Text("Deseja sair?"),
                        actions: [
                          TextButton(
                            child: Text("Cancelar"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: Text("Sair"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                );
              },
            ),
          ],
        ),
      ),

      body: IndexedStack(index: currentPageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() => currentPageIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 0, 92, 250),
        unselectedItemColor: const Color.fromARGB(255, 10, 10, 10),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('3'),
              child: const Icon(Icons.check_circle_outline),
            ),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Lembretes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendário',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Loja',
          ),
        ],
      ),
    );
  }
}
