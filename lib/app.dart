import 'package:flutter/material.dart';
import 'package:splash_app/feature/home_view/home_view.dart';

class CarCareApp extends StatelessWidget {
  const CarCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeView(),
      //onGenerateRoute: AppRouter.generateRoute,
      //theme: themData(),
    );
  }

}
