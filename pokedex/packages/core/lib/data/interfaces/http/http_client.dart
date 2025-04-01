import 'dart:async';

import 'http_response.dart';

///
/// Http client
///
abstract class IHttpClient {
  ///
  /// Http Get
  ///
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    String? apiVersion,
  });

  ///
  /// Http Head
  ///
  Future<HttpResponse> head(
    String url, {
    Map<String, String>? headers,
    String? apiVersion,
  });

  ///
  /// Http Post
  ///
  Future<HttpResponse> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? apiVersion,
  });

  ///
  /// Http Put
  ///
  Future<HttpResponse> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? apiVersion,
  });

  ///
  /// Http Patch
  ///
  Future<HttpResponse> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? apiVersion,
  });

  ///
  /// Http Delete
  ///
  Future<HttpResponse> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? apiVersion,
  });
}
