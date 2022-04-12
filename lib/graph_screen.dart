import 'package:flutter/material.dart';
import 'package:lumen_graph/graph_painter.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<double> data;

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SizedBox.expand(
        child: TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: widget.data.length),
          duration: Duration(milliseconds: 20 * widget.data.length),
          builder: (context, animValue, child) => CustomPaint(
            painter: GraphPainter(
              maxIndex: animValue,
              data: widget.data,
            ),
          ),
        ),
      ),
    );
  }
}
