import 'package:flutter/material.dart';

class LembretePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Lembrete")),
      body: Center(child: Text("Página de Cadastro de Lembretes")),
    );
  }
}

class PaginaLembrete extends StatefulWidget {
  @override
  _PaginaLembreteState createState() => _PaginaLembreteState();
}

class _PaginaLembreteState extends State<PaginaLembrete> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _observacoesController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _clearFields() {
    setState(() {
      _nomeController.clear();
      _observacoesController.clear();
      _selectedDate = null;
      _selectedTime = null;
    });
  }

  void _saveReminder() {
    String nome = _nomeController.text;
    String observacoes = _observacoesController.text;
    String data =
        _selectedDate != null
            ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
            : "Não selecionado";
    String hora =
        _selectedTime != null
            ? "${_selectedTime!.hour}:${_selectedTime!.minute}"
            : "Não selecionado";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Lembrete Salvo"),
          content: Text(
            "Nome: $nome\nData: $data\nHora: $hora\nObservações: $observacoes",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _clearFields();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrando Novos Lembretes')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Cadastrar Lembretes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome do Lembrete',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                _selectedDate == null
                    ? 'Selecionar Data'
                    : 'Data: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(
                _selectedTime == null
                    ? 'Selecionar Hora'
                    : 'Hora: ${_selectedTime!.hour}:${_selectedTime!.minute}',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _observacoesController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Observações',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveReminder,
              child: Text('Salvar Lembrete'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
