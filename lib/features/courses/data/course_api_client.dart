import 'package:attendance/features/courses/models/course.dart';
import 'package:attendance/core/api/canvas_service.dart';

const taEnrollmentId = "5022";

Future<List<Course>> getCourses() async {
  final canvasService = CanvasService();

  final body = await canvasService.get(
    "/api/v1/courses",
    queryParams: {"enrollment_role_id": taEnrollmentId},
  );

  final List<Course> courses = [];

  for (final course in body) {
    courses.add(
      Course(
        course["id"],
        course["name"],
        course["course_code"],
        course["created_at"],
      ),
    );
  }

  return courses;
}
