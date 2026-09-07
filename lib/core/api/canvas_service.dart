import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CanvasService {
  // uc.instructure.com
  final String subdomain;
  late final String apiToken;

  CanvasService({this.subdomain = "uc.instructure.com"}) {
    // TODO This can and will throw.
    apiToken = dotenv.get('CANVAS_DEV_API_TOKEN');
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic> queryParams = const {},
  }) async {
    final url = Uri.https(subdomain, path, queryParams);

    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $apiToken", "Accept": "*/*"},
    );

    resolveStatusCode(response.statusCode);

    return jsonDecode(response.body);
  }

  void resolveStatusCode(int statusCode) {
    if (statusCode != 200) {
      throw Exception("uh oh");
    }
  }
}
