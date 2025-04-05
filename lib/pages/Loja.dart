import 'package:flutter/material.dart';

class LojaPage extends StatelessWidget {
  const LojaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loja")),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: Image.asset('assets/giftcard.jpg'),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: Image.asset('assets/giftcard.jpg'),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(
                  child: Image.asset('assets/giftcard.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
