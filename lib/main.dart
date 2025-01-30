import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/feature/authentaction/data/datasource/user_remote_data_source.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  // UserRemoteDataSource(DioConsumer(dio: Dio())).userSignUp(
  //     phoneNumber: '01528126333',
  //     email: 'lolo@gmail.com',
  //     userName: 'Ahmed',
  //     password: '12343212',
  //     type: 1);
  runApp(const CarCareApp());
}
