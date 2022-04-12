import 'package:flutter/material.dart';
import 'package:lumen_graph/data.dart';
import 'package:lumen_graph/graph_screen.dart';

class GraphListScreen extends StatelessWidget {
  const GraphListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Breaths')),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => ListItem(
          status: "Valid",
          date: "12/12/2002, 15:00:20",
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.status,
    required this.date,
  }) : super(key: key);

  final String status;
  final String date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(status),
          Text(date),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GraphScreen(data: data),
          ),
        );
      },
    );
  }
}
