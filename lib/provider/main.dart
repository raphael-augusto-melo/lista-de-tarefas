import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_provider.dart'; 
import 'tela_lista_de_tarefas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(
          create: (BuildContext context) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Lista de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TelaListaDeTarefas(),
      ),
    );
  }
}
