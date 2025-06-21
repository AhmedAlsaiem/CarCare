import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/functions/roution_functions/handle_inital_routing.dart';
import 'package:splash_app/core/functions/theme_data.dart';
import 'package:splash_app/core/network/app_router.dart';

class CarCareApp extends StatelessWidget {
  const CarCareApp({super.key});
//AL
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initalRoute(context),
        onGenerateRoute: AppRouter.generateRoute,
        theme: themData(),
      ),
    );
  }
}
