import 'package:dio/dio.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper.sharedPreferences.getString(ApiKey.token);
    super.onRequest(options, handler);
  }
}
