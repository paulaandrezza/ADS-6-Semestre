import 'package:flutter/material.dart';
import 'package:layouts/pages/grid_view_page.dart';
import 'package:layouts/pages/layout_demo_page.dart';
import 'package:layouts/pages/resposive_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final ThemeData appTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
    scaffoldBackgroundColor: Color(0xFFE4F2F7),
  );

  final ThemeData appTheme2 = ThemeData(
    primarySwatch: Colors.yellow,
    appBarTheme: AppBarTheme(backgroundColor: Colors.yellow),
    scaffoldBackgroundColor: Color(0xFFFFFFE0),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercícios Flutter',
      theme: appTheme,
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
            title: Text('Exercício 1 - GridView'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Exercício 2 - Responsive'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResponsivePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Exercício 6 - Layout Demo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayoutDemoPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
