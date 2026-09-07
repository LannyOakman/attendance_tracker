import 'package:attendance/features/assignments/data/assignment_api_client.dart';
import 'package:attendance/features/assignments/models/assignment.dart';
import 'package:attendance/features/assignments/presentation/assignment_widget.dart';

import 'package:attendance/features/courses/models/course.dart';

import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  final Course course;
  const AssignmentPage({super.key, required this.course});

  @override
  State<AssignmentPage> createState() => _AssignmentPage();
}

class _AssignmentPage extends State<AssignmentPage> {
  late Future<List<Assignment>> _assignments;

  @override
  void initState() {
    super.initState();
    _assignments = getAssignments(widget.course);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Select Assignment"),
      ),
      body: Center(
        child: Card(
          child: FutureBuilder<List<Assignment>>(
            future: _assignments,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final assignments = snapshot.data!;

                // TODO: make this sort by assignment createdAt
                return ListView.builder(
                  itemCount: assignments.length,
                  itemBuilder: (context, i) =>
                      AssignmentWidget(assignment: assignments[i]),
                );
              }

              return const Center(child: Text('No assignments found.'));
            },
          ),
        ),
      ),
    );
  }
}
