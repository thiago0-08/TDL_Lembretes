import 'package:flutter/material.dart';
import 'pages/Login.dart'; // Importa a tela de login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Agora o app começa na tela de login
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
