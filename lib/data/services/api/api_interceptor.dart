import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey('requireToken')) {
      options.headers.addAll({"Authorization": "Bearer '"});

      options.headers.remove('requireToken');
    } else {
      options.headers.remove('requireToken');
    }

    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    if (options.data != null) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint(
        // ignore: unnecessary_null_comparison
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    // options.headers.addAll({"X-Api-Key": "${Globals.xAPIKey}"});

    return super.onRequest(options, handler);
  }
}

@override
Future onResponse(Response response, ResponseInterceptorHandler handler) async {
  debugPrint("Headers:");
  response.headers.forEach((k, v) => debugPrint('$k: $v'));
  debugPrint("Response: ${response.data}");
  debugPrint("<-- END HTTP");

  return handler.next(response);
}
