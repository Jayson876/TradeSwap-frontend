import 'package:flutter/material.dart';

class WorkerType extends StatelessWidget {
  final String workerType;
  final bool isSelected;
  final VoidCallback onTap;

  const WorkerType(
      {super.key, required this.workerType, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          workerType,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.yellow.shade700 : Colors.white70 ,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
