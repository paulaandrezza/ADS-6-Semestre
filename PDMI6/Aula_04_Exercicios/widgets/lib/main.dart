import 'package:flutter/material.dart';
import 'package:widgets/pages/form_page.dart';
import 'package:widgets/pages/tasks_page.dart';
import 'pages/BottomAppBar/home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercícios Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExerciseMenuPage(),
    );
  }
}

class ExerciseMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Exercícios')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Exercício 1 - Flutter Form Demo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Exercício 2 - BottomAppBar com FAB'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Exercício 3 - To-Do List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TasksPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
