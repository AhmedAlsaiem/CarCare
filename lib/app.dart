import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
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
        initialRoute: AppRoutes.loginView,
        onGenerateRoute: AppRouter.generateRoute,
      //   darkTheme:ThemeData(
      //     brightness: Brightness.values[0],
      //   primarySwatch: Colors.blue,
      //   primaryColor: Colors.white,
      //   primaryColorLight: Colors.white,
      //   primaryColorDark: Colors.white,
      //  // accentColor: Colors.white,
      //   canvasColor: Colors.white,
      //   scaffoldBackgroundColor: Colors.grey,
      //   appBarTheme: AppBarTheme(
      //    // color: Colors.grey,
      //     backgroundColor: Colors.grey
      //   )

     
    //    )   
        theme: themData(),
      ),
    );
  }
}
