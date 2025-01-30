import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/functions/theme_data.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/home_view/home_view.dart';


class CarCareApp extends StatelessWidget {
  const CarCareApp({super.key});

  @override
  Widget build(BuildContext context) {

    return   ScreenUtilInit(
      designSize:const Size(360, 800),
      minTextAdapt:true,
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        // home: HomeView(),
        // // debugShowCheckedModeBanner: false,
         
        onGenerateRoute: AppRouter.generateRoute,
        theme: themData(),
      ),

    );
  }
}
