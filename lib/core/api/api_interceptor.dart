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
        : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOiI4MjU5N2U2YS0wNzFjLTRmNDEtYTQ5YS1jN2JlYzg0ZDA0NWYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMDAwNDA1NzI2IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibWFobW91ZHNoYWJhbmtrMDExQGdtYWlsLmNvbSIsIlR5cGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTc0NTE4MTcwNiwiaXNzIjoiQ2FyQ2FyZUlkZW50aXR5IiwiYXVkIjoiQ2FyQ2FyZVVzZXJzIn0.txIjPBpiDPqKrzP0wVdynVHhxyPr1eK8bzQOTiB_H08';
    super.onRequest(options, handler);
  }
}
