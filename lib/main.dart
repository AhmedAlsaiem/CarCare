
import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  // UserRemoteDataSource(DioConsumer(dio: Dio())).login(
  //   phoneNumber: '01528126333',
  //   password: '12343212',
  // );
  runApp(const CarCareApp());
}
