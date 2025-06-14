import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCircle(
        color: ColorsManager.darkgreen,
        size: AppSize.s50,
      ),
    );
  }
}
class CustomCircularProgressIndicatorForOrder extends StatelessWidget {
  const CustomCircularProgressIndicatorForOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCircle(
        color: ColorsManager.darkgreen,
        size: AppSize.s30,
      ),
    );
  }
}