import 'package:attendance/features/courses/models/course.dart';
import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final Course course;
  final void Function(Course)? onTap;

  const CourseWidget({super.key, required this.course, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap != null ? () => onTap!(course) : null,
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
      ),
    );
  }
}
