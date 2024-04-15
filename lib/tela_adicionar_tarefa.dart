import 'package:flutter/material.dart';

class Tarefa {
  String titulo;
  String descricao;

  Tarefa({required this.titulo, required this.descricao});
}

class TelaAdicionarTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controlador = TextEditingController();

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
              controller: _controlador,
              decoration: InputDecoration(labelText: 'Título da Tarefa'),
              onSubmitted: (valor) {
                Navigator.pop(context, valor);
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controlador.text);
              },
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
