import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(options.headers.values.contains('token')){
      options.headers.remove('token');
      options.headers.addAll({
        "Authorization": "Bearer ",
      });
    }

    print('REQUEST[${options.method}] => PATH: ${options.path} HEADER: ${options.headers} DATA: ${options.data}');

    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('ERROR MESSAGE => ${err.message}');
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} HEADER: ${err.requestOptions.headers} DATA: ${err.requestOptions.data}');
    return super.onError(err, handler);
  }
}