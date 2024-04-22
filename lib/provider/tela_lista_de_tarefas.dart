import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_provider.dart';
import 'tela_adicionar_tarefa.dart';

class TelaListaDeTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(taskProvider.tasks[index]),
            onDismissed: (direction) {
              taskProvider.removeTask(index);
            },
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
            ),
            child: ListTile(
              title: Text(taskProvider.tasks[index]),
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
            taskProvider.addTask(novaTarefa);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
