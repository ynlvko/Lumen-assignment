import 'package:flutter/material.dart';
import 'package:lumen_graph/graph_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<String>(
        builder: (context, snapshot) => GraphListScreen(),
      ),
    );
  }
}
