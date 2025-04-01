class HttpOptions {
  final String url;
  final Map<String, String>? headers;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;

  const HttpOptions({
    required this.url,
    this.headers,
    this.query,
    this.body,
  });

  HttpOptions copyWith({
    String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return HttpOptions(
      url: url ?? this.url,
      headers: headers ?? this.headers,
      query: query ?? this.query,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'headers': headers,
      'query': query,
      'body': body,
    };
  }
}
