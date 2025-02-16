import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/my_car/presebtation/view/myCar_view_body.dart';

class MyCarsView extends StatelessWidget {
  const MyCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NavigatorManager.pushName(
                context: context, route: AppRoutes.addcar);
          },
          shape:const CircleBorder(), // Explicitly set the shape to circular
          backgroundColor: ColorsManager.mainColor, // Change background color
          elevation: 10, // Increase elevation (shadow)
          mini: false,
          child: const Icon(
            Icons.add,
            color: ColorsManager.black,
            size: 32,
          ), // Set to true for a smaller FAB
        ),
        appBar: AppBar(
          title: const Text('My Cars'),
          centerTitle: true,
        ),
        body: const MycarViewBody(),
      ),
    );
  }
}
