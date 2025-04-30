import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51QPMWrJqPNUV240JiWLMmVP7St5TrTBUlrY3jPdmSxCFRlFJPorrk4xgBLA4rYmocqEmgMuOmdAQXs0p0eSWzdw700pBnZfokd'; // استبدلها بمفتاحك الصحيح
  await Stripe.instance.applySettings();
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
