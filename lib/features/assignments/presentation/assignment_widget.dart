import 'package:attendance/features/assignments/models/assignment.dart';

import 'package:flutter/material.dart';

class AssignmentWidget extends StatelessWidget {
  final Assignment assignment;

  const AssignmentWidget({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.0,
          children: [
            Text(
              assignment.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              assignment.createdAt,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
