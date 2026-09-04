import 'package:attendance/features/courses/models/course.dart';
import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final Course course;

  const CourseWidget({super.key, required this.course});

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
            Text(course.name, style: Theme.of(context).textTheme.titleLarge),
            Text(
              course.courseCode,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
