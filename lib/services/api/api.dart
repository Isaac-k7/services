import 'dart:async';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:http/http.dart';

export 'api_failure.dart';
export 'api_success.dart';
export 'api_response.dart';

class Api {
  static http.Client? _client;

  static final Uri _url = Uri.parse(
    (FlutterConfig.get('API_URL') ?? '').replaceAll(RegExp(r'/$'), ''),
  );

  static final Map<String, dynamic> _headers = {
    'content-type': 'application/json',
    'x-requested-with': 'XMLHttpRequest',
    'Accept-Language': 'en',
  };

  static void initialize({http.Client? client}) {
    assert(_client == null, 'Client already initialized');
    if (client == null) {
      _client = http.Client();
    } else {
      _client = client;
    }
  }

  static void close() {
    if (_client != null) {
      _client?.close();
      _client = null;
    }
  }

  static void addHeader(String key, String value) {
    _headers.update(key, (_) => value, ifAbsent: () => value);
  }

  static void removeHeader(String key) {
    _headers.remove(key);
  }

  static Future<http.Response> get(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParameters,
  }) async {
    assert(_client != null, 'Client must be initialized');
    return await _client!.get(
      Uri(
        scheme: _url.scheme,
        host: _url.host,
        path: '${_url.path}/$endpoint',
        queryParameters: queryParameters,
      ),
      headers: {
        ..._headers,
        ...headers,
      },
    );
  }

  static Future<http.Response> patch(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    assert(_client != null, 'Client must be initialized');
    return await _client!.patch(
      Uri(
        scheme: _url.scheme,
        host: _url.host,
        path: '${_url.path}/$endpoint',
      ),
      headers: {
        ..._headers,
        ...headers,
      },
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> post(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    assert(_client != null, 'Client must be initialized');
    return await _client!.post(
      Uri(
        scheme: _url.scheme,
        host: _url.host,
        path: '${_url.path}/$endpoint',
      ),
      
      headers: {
        ..._headers,
        ...headers,
      },
      body: jsonEncode(body),
    );
  }


  static Future<http.StreamedResponse> postWithFiles(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
    http.MultipartFile? files,

  }) async {
    assert(_client != null, 'Client must be initialized');
    var request = http.MultipartRequest('POST', Uri(
        scheme: _url.scheme,
        host: _url.host,
        path: '${_url.path}/$endpoint',
      ),);
      request.fields.addAll({...body});
      request.headers.addAll({
        ..._headers,
        ...headers,
      });
      if(files != null)request.files.add(files);
    return await request.send();
  }

  static Future<http.Response> put(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    assert(_client != null, 'Client must be initialized');
    return await _client!.put(
      Uri(
        scheme: _url.scheme,
        host: _url.host,
        path: '${_url.path}/$endpoint',
      ),
      headers: {
        ..._headers,
        ...headers,
      },
      body: jsonEncode(body),
    );
  }
  static Future<http.Response> delete(
    String endpoint, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    assert(_client != null, 'Client must be initialized');
    return await _client!.delete(
      Uri(
        scheme: _url.scheme,
        host: _url.host,
        path: '${_url.path}/$endpoint',
      ),
      headers: {
        ..._headers,
        ...headers,
      },
      body: jsonEncode(body),
    );
  }
}
