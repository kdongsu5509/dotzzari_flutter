import 'package:dio/dio.dart';
import 'package:dotzzari/retrofit_repo/dioInterceptor.dart';

final Dio customDio = Dio()..interceptors.add(DioInterceptor());