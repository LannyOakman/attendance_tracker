import 'dart:convert';

import 'package:attendance/features/courses/models/course.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const String ucCanvasUrl = "uc.instructure.com";
const String taEnrollmentId = "5022";
final String canvasApiToken = dotenv.get('CANVAS_DEV_API_TOKEN');

Future<List<Course>> getCourses() async {
  final url = Uri.https(ucCanvasUrl, "/api/v1/courses", {
    "enrollment_role_id": taEnrollmentId,
  });

  final response = await http.get(
    url,
    headers: {"Authorization": "Bearer $canvasApiToken", "Accept": "*/*"},
  );

  if (response.statusCode != 200) {
    throw Exception("uh oh");
  }

  final List body = jsonDecode(response.body);

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
