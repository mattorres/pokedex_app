import 'dart:async';

import 'package:dependencies/dependencies.dart';

import 'http_options.dart';
import 'http_response.dart';

abstract class HttpHandler {
  @mustCallSuper
  FutureOr<HttpOptions> onRequest(HttpOptions request) {
    return request;
  }

  @mustCallSuper
  FutureOr<HttpResponse> onResponse(
    HttpOptions request,
    HttpResponse response,
  ) {
    return response;
  }
}
