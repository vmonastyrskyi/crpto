import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/dio_client.g.dart';

@riverpod
Dio dioClient(Ref ref, {List<Interceptor>? interceptors, String? baseUrl}) {
  final options = BaseOptions(baseUrl: baseUrl ?? '');

  final dio = Dio(options)..interceptors.addAll(interceptors ??= []);

  return dio;
}
