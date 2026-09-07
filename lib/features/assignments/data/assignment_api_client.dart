import 'package:attendance/core/api/canvas_service.dart';
import 'package:attendance/features/courses/models/course.dart';
import 'package:attendance/features/assignments/models/assignment.dart';

const String taEnrollmentId = "5022";

Future<List<Assignment>> getAssignments(Course course) async {
  final canvasService = CanvasService();

  final body = await canvasService.get(
    "/api/v1/courses/${course.id}/assignments",
  );

  final List<Assignment> assignments = [];

  for (final assignment in body) {
    assignments.add(
      Assignment(
        assignment["id"],
        assignment["name"] ?? "",
        assignment["description"] ?? "",
        assignment["created_at"] ?? "",
        assignment["due_at"] ?? "",
      ),
    );
  }

  return assignments;
}
