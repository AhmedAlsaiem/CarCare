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
        : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOiJiMDBkMzBkYy05NTZmLTQwYjktOWJkMC02NWNmNDQ3ZWJjZTMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMDAwMDAwMDAwIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiYWhtZWRhbHNhaWVtMjAyNUBnbWFpbC5jb20iLCJUeXBlIjoiVXNlciIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJleHAiOjE3NDE2MTE3OTUsImlzcyI6IkNhckNhcmVJZGVudGl0eSIsImF1ZCI6IkNhckNhcmVVc2VycyJ9.b8_kR06mQKWJ5KG2BiqAI8uwkGos43rlHGsL7ciXYFU';
    super.onRequest(options, handler);
  }
}
