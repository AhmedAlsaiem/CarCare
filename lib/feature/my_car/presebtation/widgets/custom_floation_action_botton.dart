
import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class CustomFloatinActionButton extends StatelessWidget {
  const CustomFloatinActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        NavigatorManager.pushName(context: context, route: AppRoutes.addcar);
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(
              AppSize.s10))), // Explicitly set the shape to circular
      backgroundColor: ColorsManager.darkgreen, // Change background color
      elevation: 10, // Increase elevation (shadow)
      mini: false,
    
      child: const Icon(
        Icons.add,
        color: ColorsManager.white,
        size: 32,
      ), // Set to true for a smaller FAB
    );
  }
}
