import 'package:flutter/material.dart';
import 'tela_adicionar_tarefa.dart';

class TelaListaDeTarefas extends StatefulWidget {
  @override
  _TelaListaDeTarefasState createState() => _TelaListaDeTarefasState();
}

class _TelaListaDeTarefasState extends State<TelaListaDeTarefas> {
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(tarefas[index]),
            onDismissed: (direction) {
              setState(() {
                tarefas.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
            ),
            child: ListTile(
              title: Text(tarefas[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novaTarefa = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaAdicionarTarefa()),
          );
          if (novaTarefa != null) {
            setState(() {
              tarefas.add(novaTarefa);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
