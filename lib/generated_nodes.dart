import 'dart:math';

import 'package:drawingsample/src/domain/model/edge.dart';
import 'package:drawingsample/src/domain/model/graph.dart';
import 'package:drawingsample/src/domain/model/menu_entry.dart';
import 'package:drawingsample/src/domain/model/node.dart';
import 'package:drawingsample/src/presentation/state/controller.dart';
import 'package:drawingsample/src/presentation/view/canvas.dart';
import 'package:flutter/material.dart';

class GeneratedNodes extends StatefulWidget {
  const GeneratedNodes({super.key});

  @override
  State<GeneratedNodes> createState() => _GeneratedNodesState();
}

class _GeneratedNodesState extends State<GeneratedNodes> {
  late InfiniteCanvasController controller;
  final gridSize = const Size.square(25);

  @override
  void initState() {
    super.initState();
    // Generate random nodes

    // final nodes = List.generate(100, (index) {
    //   final color = Colors.lightBlue;
    //   final size = Random().nextDouble() * 200 + 100;
    //   return InfiniteCanvasNode(
    //     key: UniqueKey(),
    //     label: 'Node $index',
    //     resizeMode: ResizeMode.cornersAndEdges,
    //     offset: Offset(
    //       Random().nextDouble() * 5000,
    //       Random().nextDouble() * 5000,
    //     ),
    //     size: Size.square(size),
    //     child: Builder(
    //       builder: (context) {
    //         return CustomPaint(
    //           painter: InlineCustomPainter(
    //             brush: Paint()..color = color,
    //             builder: (brush, canvas, rect) {
    //               // Draw circle
    //               final diameter = min(rect.width, rect.height);
    //               final radius = diameter / 2;
    //               canvas.drawCircle(rect.center, radius, brush);
    //             },
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // });
    // // Generate random edges
    // final edges = <InfiniteCanvasEdge>[];
    // for (int i = 0; i < nodes.length; i++) {
    //   final from = nodes[i];
    //   final to = nodes[Random().nextInt(nodes.length)];
    //   if (from != to) {
    //     edges.add(InfiniteCanvasEdge(
    //       from: from.key,
    //       to: to.key,
    //       label: 'Edge $i',
    //     ));
    //   }
    // }
    controller = InfiniteCanvasController(
        nodes: [],
        edges: [],
        snapMovementToGrid: true,
        snapResizeToGrid: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing Sample'),
        centerTitle: false,
      ),
      body: InfiniteCanvas(
        drawVisibleOnly: true,
        canAddEdges: true,
        controller: controller,
        gridSize: gridSize,
        menus: [
          MenuEntry(
            label: 'Create',
            menuChildren: [
              MenuEntry(
                label: 'Straight Line',
                onPressed: () {
                  final color = Colors.red;
                  final node = InfiniteCanvasNode(
                    key: UniqueKey(),
                    label: 'Node ${controller.nodes.length}',
                    resizeMode: ResizeMode.cornersAndEdges,
                    offset: controller.mousePosition,
                    size: Size(
                      Random().nextDouble() * 200 + 100,
                      Random().nextDouble() * 200 + 100,
                    ),
                    child: Builder(
                      builder: (context) {
                        return CustomPaint(
                          painter: InlineCustomPainter(
                            brush: Paint()
                              ..color = color
                              ..strokeWidth=2,
                            builder: (brush, canvas, rect) {
                              // Draw Straight Line
                              canvas.drawLine(rect.topLeft,rect.bottomRight, brush);
                            },
                          ),
                        );
                      },
                    ),
                  );
                  controller.add(node);
                },
              ),
              MenuEntry(
                label: 'Circle',
                onPressed: () {
                  final color = Colors.red;
                  final node = InfiniteCanvasNode(
                    key: UniqueKey(),
                    label: 'Node ${controller.nodes.length}',
                    resizeMode: ResizeMode.cornersAndEdges,
                    offset: controller.mousePosition,
                    size: Size(
                      Random().nextDouble() * 200 + 100,
                      Random().nextDouble() * 200 + 100,
                    ),
                    child: Builder(
                      builder: (context) {
                        return CustomPaint(
                          painter: InlineCustomPainter(
                            brush: Paint()..color = color,
                            builder: (brush, canvas, rect) {
                              // Draw circle
                              final diameter = min(rect.width, rect.height);
                              final radius = diameter / 2;
                              canvas.drawCircle(rect.center, radius, brush);
                            },
                          ),
                        );
                      },
                    ),
                  );
                  controller.add(node);
                },
              ),
              MenuEntry(
                label: 'Triangle',
                onPressed: () {
                  final color = Colors.blue;
                  final node = InfiniteCanvasNode(
                    key: UniqueKey(),
                    label: 'Node ${controller.nodes.length}',
                    resizeMode: ResizeMode.cornersAndEdges,
                    offset: controller.mousePosition,
                    size: Size(
                      Random().nextDouble() * 200 + 100,
                      Random().nextDouble() * 200 + 100,
                    ),
                    child: Builder(
                      builder: (context) {
                        return CustomPaint(
                          painter: InlineCustomPainter(
                            brush: Paint()..color = color,
                            builder: (brush, canvas, rect) {
                              // Draw triangle
                              final path = Path()
                                ..moveTo(rect.left, rect.bottom)
                                ..lineTo(rect.right, rect.bottom)
                                ..lineTo(rect.center.dx, rect.top)
                                ..close();
                              canvas.drawPath(path, brush);
                            },
                          ),
                        );
                      },
                    ),
                  );
                  controller.add(node);
                },
              ),
              MenuEntry(
                label: 'Rectangle',
                onPressed: () {
                  final color = Colors.orange;
                  final node = InfiniteCanvasNode(
                    key: UniqueKey(),
                    label: 'Node ${controller.nodes.length}',
                    resizeMode: ResizeMode.cornersAndEdges,
                    offset: controller.mousePosition,
                    size: Size(
                      Random().nextDouble() * 200 + 100,
                      Random().nextDouble() * 200 + 100,
                    ),
                    child: Builder(
                      builder: (context) {
                        return CustomPaint(
                          painter: InlineCustomPainter(
                            brush: Paint()..color = color,
                            builder: (brush, canvas, rect) {
                              // Draw rectangle
                              canvas.drawRect(rect, brush);
                            },
                          ),
                        );
                      },
                    ),
                  );
                  controller.add(node);
                },
              ),
            ],
          ),
          // MenuEntry(
          //   label: 'Info',
          //   menuChildren: [
          //     MenuEntry(
          //       label: 'Cycle',
          //       onPressed: () {
          //         final fd = controller.getDirectedGraph();
          //         final messenger = ScaffoldMessenger.of(context);
          //         final result = fd.cycle;
          //         messenger.showSnackBar(
          //           SnackBar(
          //             content: Text(
          //                 'Cycle found: ${result.map((e) => e.key.toString()).join(', ')}'),
          //           ),
          //         );
          //       },
          //     ),
          //     MenuEntry(
          //       label: 'In Degree',
          //       onPressed: () {
          //         final fd = controller.getDirectedGraph();
          //         final result = fd.inDegreeMap;
          //         // Show dismissible dialog
          //         showDialog(
          //           context: context,
          //           builder: (context) {
          //             return AlertDialog(
          //               title: const Text('In Degree'),
          //               content: SingleChildScrollView(
          //                 child: Column(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     for (final entry in result.entries.toList()
          //                       ..sort(
          //                         (a, b) => b.value.compareTo(a.value),
          //                       ))
          //                       Text(
          //                         '${entry.key.id}: ${entry.value}',
          //                         style: const TextStyle(fontSize: 12),
          //                       ),
          //                   ],
          //                 ),
          //               ),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () => Navigator.of(context).pop(),
          //                   child: const Text('Close'),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class InlineCustomPainter extends CustomPainter {
  const InlineCustomPainter({
    required this.brush,
    required this.builder,
    this.isAntiAlias = true,
  });
  final Paint brush;
  final bool isAntiAlias;
  final void Function(Paint paint, Canvas canvas, Rect rect) builder;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    brush.isAntiAlias = isAntiAlias;
    canvas.save();
    builder(brush, canvas, rect);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
