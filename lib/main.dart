import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await CacheHelper().init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const CarCareApp(),
    ),
  );
}
