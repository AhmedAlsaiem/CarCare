import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/feature/add_car/presentation/pages/add_car_body.dart';

class CarCareApp extends StatelessWidget {
  const CarCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt:true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home:AddCarBody(),
        //onGenerateRoute: AppRouter.generateRoute,
        //theme: themData(),
      ),
    );
  }

}
