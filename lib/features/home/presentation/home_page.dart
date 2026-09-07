import 'package:attendance/features/courses/data/course_api_client.dart';
import 'package:attendance/features/courses/models/course.dart';
import 'package:attendance/features/courses/presentation/course_widget.dart';
import 'package:attendance/features/assignments/presentation/pages/assignment_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Course>> _courses;

  @override
  void initState() {
    super.initState();
    _courses = getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Select Course"),
      ),
      body: Center(
        child: Card(
          child: FutureBuilder<List<Course>>(
            future: _courses,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final courses = snapshot.data!;

                // TODO: make this sort by course createdAt
                return ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, i) => CourseWidget(
                    course: courses[i],
                    onTap: (Course c) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AssignmentPage(course: c),
                      ),
                    ),
                  ),
                );
              }

              return const Center(
                child: Text(
                  'No Courses found. Check if enrollment status is TA',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
