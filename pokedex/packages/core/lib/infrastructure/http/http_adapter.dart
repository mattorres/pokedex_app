import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/data.dart';

class HttpAdapter extends HttpHandler implements IHttpClient {
  final http.Client _client;

  final FutureOr<String> baseUrl;

  HttpAdapter({
    required http.Client client,
    required this.baseUrl,
  }) : _client = client;

  @override
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    String? apiVersion,
  }) async {
    final uri = _buildUri(url, query);
    final response = await _client.get(uri, headers: headers);
    return _toHttpResponse(response);
  }

  @override
  Future<HttpResponse> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? apiVersion,
  }) async {
    final uri = _buildUri(url, query);
    final response = await _client.post(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return _toHttpResponse(response);
  }

  @override
  Future<HttpResponse> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? apiVersion,
  }) async {
    final uri = _buildUri(url, query);
    final response = await _client.put(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return _toHttpResponse(response);
  }

  @override
  Future<HttpResponse> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? apiVersion,
  }) async {
    final uri = _buildUri(url, query);
    final response = await _client.delete(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return _toHttpResponse(response);
  }

  @override
  Future<HttpResponse> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? apiVersion,
  }) async {
    final uri = _buildUri(url, query);
    final response = await _client.patch(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return _toHttpResponse(response);
  }

  @override
  Future<HttpResponse> head(
    String url, {
    Map<String, String>? headers,
    String? apiVersion,
  }) async {
    final uri = _buildUri(url, null);
    final response = await _client.head(uri, headers: headers);
    return _toHttpResponse(response);
  }

  // Método auxiliar para construir a URI com query parameters
  Uri _buildUri(String url, Map<String, dynamic>? query) {
    if (query == null || query.isEmpty) return Uri.parse('${baseUrl}/$url');
    return Uri.parse(url).replace(
        queryParameters: query.map(
      (key, value) => MapEntry(key, value.toString()),
    ));
  }

  // Método auxiliar para converter http.Response em HttpResponse
  HttpResponse _toHttpResponse(http.Response response) {
    return HttpResponse(
      status: HttpStatus.accepted,
      data: response.body,
    );
  }
}
