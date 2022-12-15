import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_response.dart';

class ApiSuccess<T> extends ApiResponse {
  late T _data;

  ApiSuccess(http.Response response) : super(response.statusCode) {
    String body = response.body;
    var parsedJson = json.decode(body);
    _data = parsedJson['data'];
  }

  T get data => _data;
}
