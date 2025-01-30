import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();

  runApp(const CarCareApp());
}
