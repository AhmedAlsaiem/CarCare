import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/feature/add_car/add_car.dart';
import 'package:splash_app/feature/home_view/home_view.dart';

class CarCareApp extends StatelessWidget {
  const CarCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt:true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home:AddCar(),
        //onGenerateRoute: AppRouter.generateRoute,
        //theme: themData(),
      ),
    );
  }

}
