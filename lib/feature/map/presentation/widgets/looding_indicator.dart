import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class LoadingAndErrorHandler extends StatelessWidget {
  final bool isLoading;
  final String errorMessage;
  final Widget child;

  const LoadingAndErrorHandler({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: ColorsManager.mainColor,));
    } else if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    } else {
      return child;
    }
  }
}