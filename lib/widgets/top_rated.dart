import 'package:flutter/material.dart';
import '../models/workers_model.dart';

class TopRated extends StatelessWidget {
  final List<Worker> workers;
  const TopRated({Key? key, required this.workers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: workers.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return const Card(
          color: Colors.red,
        );
      },
    );
  }
}
