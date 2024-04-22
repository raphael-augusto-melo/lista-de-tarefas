import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_provider.dart';

class TelaAdicionarTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Título da Tarefa'),
              onSubmitted: (valor) {
                Provider.of<TaskProvider>(context, listen: false).addTask(valor);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false).addTask(_controller.text);
                Navigator.pop(context);
              },
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
