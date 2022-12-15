import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_response.dart';

class ApiFailure extends ApiResponse {
  late Map<String, dynamic>? _errors;
  late String _message;
  late String _description;

  ApiFailure(http.Response response) : super(response.statusCode) {
    String body = response.body;
    var parsedJson = json.decode(body);
    _errors = parsedJson['errors'] ?? {};
    _message = parsedJson['message'] ?? '';
    _description = parsedJson['description'] ?? '';
  }
  
  // ApiFailure(http.StreamedResponse response) : super(response.statusCode) {
  //   final body = await response.stream.bytesToString();
  //   var parsedJson =  json.decode(body);
  //   _errors = parsedJson['errors'] ?? {};
  //   _message = parsedJson['message'] ?? '';
  //   _description = parsedJson['description'] ?? '';
  // }

  Map<String, dynamic>? get errors => _errors;
  String get description => _description;
  String get message => _message;
}
