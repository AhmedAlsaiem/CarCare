import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'app.dart';

void main() async {
   await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();
  //final localAuthService = LocalAuthService();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const CarCareApp(),
    ),
  );
}

 
