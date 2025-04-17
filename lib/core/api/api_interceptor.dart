import 'package:dio/dio.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = CacheHelper()
                .getData(key: ApiKey.token) !=
            null
        ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}'
        : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOiI5OThmM2U5NS0zZTNjLTRhYjUtOTgyYy1lZjdkMzFmMjkwYmYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMDE4MTgxODE4IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoic2FsZW01NDVAZ21haWwuY29tIiwiVHlwZSI6IlVzZXIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwiZXhwIjoxNzQ1MTQ2Mjc2LCJpc3MiOiJDYXJDYXJlSWRlbnRpdHkiLCJhdWQiOiJDYXJDYXJlVXNlcnMifQ.szOzyqez8dQi1NVsPLaEYYSfUS2Z1JrKquZpRwR8qbM';
    super.onRequest(options, handler);
  }
}
